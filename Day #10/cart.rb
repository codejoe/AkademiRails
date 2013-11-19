# Order
# --------------
# - atributes
# order_number
# total_amount
# date
# status (onprocess complete)
# => relation : items
# - class methods
# all
# where by order_number, date
# first
# - instance methods
# save
# destroy
# add_item item 
# remove_item item 
# update_status status

# Item
# --------------
# - atributes
# order_id
# name
# price
# quantity

require 'sqlite3'

# CART
class Cart
  TABLE_ORDER = 'Orders'
  TABLE_ITEM  = 'Items'
  DB_NAME     = 'database_cart.db'
  DB = SQLite3::Database.open DB_NAME
  DB.results_as_hash = true
  TODAY = Time.now

  def create_table
    # Create Table Order
    DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_ORDER} 
    (order_id integer primary key autoincrement, order_number integer, total_amount integer, date date, status text)"
    # Create Table Item
    DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_ITEM} 
    (item_id integer primary key autoincrement, order_id integer, name text, price integer, quantity integer)" 
  end

  attr_accessor :order_id, :order_number, :total_amount, :date, :status

  def initialize(order_number = '', total_amount = '', date = '')
    @order_number = order_number
    @total_amount = total_amount
    @date         = date
    @status       = 'uncomplete'    
  end

  def self.all
    orders = []
    results = DB.execute "SELECT * FROM #{TABLE_ORDER}"
    results.each do |row|
      order              = new row['order_number'], row['total_amount'], row['date']
      order.order_id     = row['order_id']
      order.status       = row['status']
      orders << order
    end
    orders
  end

  def save
    if order_id.nil?
      DB.execute "INSERT INTO #{TABLE_ORDER} (order_number, total_amount, date, status) VALUES (:order_number, :total_amount, :date, :status)", 
      order_number: order_number, total_amount: total_amount, date: date, status: status
    else
      DB.execute "UPDATE #{TABLE_ORDER} SET order_number = :order_number, total_amount = :total_amount, date = :date, status = :status WHERE order_id = :order_id", 
      order_number: order_number, total_amount: total_amount, date: date, status: status, order_id: order_id
    end
  end

  def destroy
    unless order_id.nil?
      DB.execute "DELETE FROM #{TABLE_ORDER} WHERE order_id = :order_id", 
      order_id: order_id
    end
    # CREATE NEW OBJECT, reload all updated objects
  end

  def add_item(item)
    puts item.order_id
  end

  def remove_item(item)
  end

  def update_status(status)
  end

  def where
  end
end

# ITEMS
class Items < Cart
  attr_accessor :item_id, :order_id, :name, :price, :quantity

  def initialize(order_id ='', name ='', price ='', quantity ='')
    @order_id = order_id
    @name = name
    @price = price
    @quantity = quantity
  end

  def self.all
    items = []
    results = DB.execute "SELECT * FROM #{TABLE_ITEM}"
    results.each do |row|
      item              = new row['order_id'], row['name'], row['price'], row['quantity']
      item.item_id     = row['item_id']
      items << item
    end
    items
  end

  def save
    if item_id.nil?
      DB.execute "INSERT INTO #{TABLE_ITEM} (order_id, name, price, quantity) VALUES (:order_id, :name, :price, :quantity)", 
      order_id: order_id, name: name, price: price, quantity: quantity 
    else
      DB.execute "UPDATE #{TABLE_ITEM} SET order_id = :order_id, name = :name, price = :price, quantity = :quantity WHERE item_id = :item_id", 
      order_id: order_id, name: name, price: price, quantity: quantity, item_id: item_id
    end
  end

  def destroy
    unless item_id.nil?
      DB.execute "DELETE FROM #{TABLE_ITEM} WHERE item_id = :item_id", 
      item_id: item_id
    end
    # CREATE NEW OBJECT, reload all updated objects
  end
end

# HOW TO USE
# -----------------------------------
# LIST ALL ORDER
# cart = Cart.all

# CREATE NEW ORDER
# newcart = Cart.new
# newcart.order_number = 123
# newcart.save

# FIND THE FIRST ORDER AND UPDATE IT
# cart1 = Cart.all.first
# cart1
# cart1.status = 'Complete'
# cart1.save