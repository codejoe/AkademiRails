require 'sqlite3'

class DatabaseConnection
  DB = SQLite3::Database.open 'order_new.db'
  DB.results_as_hash = true

  def self.all(params = {})
    query = params[:query] || "SELECT * FROM #{self::TABLE_NAME}"
    results = DB.execute query, params[:bind_params]
    results.inject([]) { |memo, row| memo << row_to_object(row) }
  end

  def self.find(id)
    query = "SELECT * FROM #{self::TABLE_NAME} WHERE id = :id"
    row   = DB.get_first_row query, id: id

    row_to_object(row) unless row.nil?
  end

  def save
    if id.nil?
      create
    else
      update
    end

    self
  end

  def destroy
    query = "DELETE FROM #{self.class::TABLE_NAME} WHERE id = :id"
    DB.execute query, id: id
    self.class.find(id).nil?
  end

end

class Order < DatabaseConnection
  TABLE_NAME  = 'orders'
  DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_NAME} (id Integer Primary Key Autoincrement, order_number, date, status)"

  attr_accessor :id, :order_number, :date, :status

  def initialize(params = {})
    @id           = params[:id]
    @order_number = params[:order_number]
    @date         = params[:date]   || Date.today.to_s
    @status       = params[:status] || 'onprocess'
  end

  def self.row_to_object(row)
    new({
      id:           row['id'],
      order_number: row['order_number'],
      date:         row['date'],
      status:       row['status']
    })
  end

  def create
    query = "INSERT INTO #{TABLE_NAME} (order_number, date, status) VALUES (:order_number, :date, :status)"
    DB.execute query, order_number: order_number, date: date, status: status
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE #{TABLE_NAME} SET order_number = :order_number, date = :date, status = :status WHERE id = :id"
    DB.execute query, order_number: order_number, date: date, status: status, id: id
  end

  def total
    items.inject(0) { |total, order_item| total += order_item.subtotal }
  end

  def items
    OrderItem.find_by_order_id id
  end

  def add_item(item, quantity = 1)
    save if id.nil?

    if order_item = items.select { |order_item| order_item.item_id == item.id }.first
      order_item.quantity += quantity
    else
      order_item = OrderItem.new order_id: id, item_id: item.id, quantity: quantity
    end
    order_item.save

    items
  end

  def remove_item(item, quantity = 1)
    order_item = items.select { |order_item| order_item.item_id == item.id }.first
    return if order_item.nil?

    if order_item.quantity - quantity <= 0
      order_item.destroy
    else
      order_item.quantity -= quantity
      order_item.save
    end

    items
  end

  def destroy
    super && items.all? {|order_item| order_item.destroy }
  end
end

class OrderItem < DatabaseConnection
  TABLE_NAME  = 'order_items'
  DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_NAME} (id Integer Primary Key Autoincrement, order_id Integer, item_id Integer, quantity Integer)"

  attr_accessor :id, :order_id, :item_id, :quantity
  attr_reader   :name, :price

  def initialize(params = {})
    @id       = params[:id]
    @order_id = params[:order_id]
    @item_id  = params[:item_id]
    @quantity = params[:quantity] || 1

    @name     = params[:name]
    @price    = params[:price]
  end

  def self.all(params = {})
    query = params[:query] || "SELECT * FROM order_items LEFT JOIN items ON order_items.item_id = items.id"
    super query: query, bind_params: params[:bind_params]
  end

  def self.find_by_order_id(order_id)
    query = "SELECT *
            FROM items JOIN
                  order_items ON items.id = order_items.item_id
            WHERE order_items.order_id = :order_id"
    all(query: query, bind_params: { order_id: order_id })
  end

  def self.row_to_object(row)
    new({
      id:       row['id'],
      order_id: row['order_id'],
      item_id:  row['item_id'],
      quantity: row['quantity'],

      name:     row['name'],
      price:    row['price']
    })
  end

  def create
    query = "INSERT INTO #{TABLE_NAME} (order_id, item_id, quantity) VALUES (:order_id, :item_id, :quantity)"
    DB.execute query, order_id: order_id, item_id: item_id, quantity: quantity
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE #{TABLE_NAME} SET order_id = :order_id, item_id = :item_id, quantity = :quantity WHERE id = :id"
    DB.execute query, order_id: order_id, item_id: item_id, quantity: quantity, id: id
  end

  def subtotal
    price * quantity
  end
end

class Item < DatabaseConnection
  TABLE_NAME  = 'items'
  DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_NAME} (id Integer Primary Key Autoincrement, name, price Float)"

  # id must be attr_reader
  attr_accessor :id, :name, :price

  def self.row_to_object(row)
    new(row['name'], row['price'], row['id'])
  end

  def initialize(name, price, id = nil)
    @name  = name
    @price = price
    @id    = id
  end

  def create
    query = "INSERT INTO #{TABLE_NAME} (name, price) VALUES (:name, :price)"
    DB.execute query, name: name, price: price
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE #{TABLE_NAME} SET name = :name, price = :price WHERE id = :id"
    DB.execute query, name: name, price: price, id: id
  end
end