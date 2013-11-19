require 'sqlite3'
require 'colorize'

class Order 
  TABLE_NAME = 'Orders'
  DB = SQLite3::Database.open 'cart.db'
  DB.results_as_hash = true
  DB.execute "CREATE TABLE IF NOT EXISTS #{TABLE_NAME} (order_id INTEGER PRIMARY KEY AUTOINCREMENT, total int, date_created date, status char(20) default 'onprocess')"



  attr_accessor :total, :date, :status, :orders, :items, :order_id

  def initialize(order_id = nil,status = "onprocess", total=0, date = Time.now.to_s)
    @order_id = order_id
    @total    = total
    @date     = date
    @status   = status
    @items = []
    reload if @order_id != nil
  end

  # Menghitung kembali total pada order
  def total_order
    rs = DB.execute "SELECT SUM(a.quantity*b.price) AS total FROM OrderDetail a,Items b WHERE order_id = :id AND b.item_id=a.item_id", :id => @order_id
    rs.each do |total|
      @total = total['total']
    end
  end

  # Memperbarui Data Items pada Order Objek
  def reload
    @items=[]
    temp = DB.execute "SELECT a.item_id,b.quantity,a.price,a.name FROM Items a, OrderDetail b WHERE a.item_id=b.item_id AND b.order_id=:id",
      :id => @order_id
    temp.each do |item|
      @items << Items.new(item['item_id'], item['quantity'], item['name'], item['price'])
    end
    total_order
  end

  # Class Method

  def self.all
    @orders = []
    rs = DB.execute "SELECT * FROM #{TABLE_NAME}"
    rs.each do |order|
      @orders << new(order['order_id'], order['status'], order['total'], order['date_created'])
    end
    @orders
  end

  # def self.where(order_number, date)
  #   rs = @orders.select do |x|
  #      x.order_id == order_number || x.date == date
  #   end
  # end

  # def print

  # end
  # Instance Method

  # Digunakan untuk melakukan save / update data terbaru berdasarkan ID
  def save
    @date = Time.now.to_s
    if @order_id.nil?
      DB.execute "INSERT INTO #{TABLE_NAME}(total,date_created,status) VALUES (:total,:date,:status)",
        :total => @total, :date => @date, :status => @status
        
        notification = "Inserted".green
    else
      DB.execute "UPDATE #{TABLE_NAME} SET total = :total, date_created = :date, status = :status WHERE order_id = :id",
        :total => @total, :date => @date, :status => @status, :id => @order_id
      notification = "Updated".green
    end
    reload
    puts notification
  end

  # Menghapus Order id yang ada 
  def destroy
    DB.execute "DELETE FROM #{TABLE_NAME} WHERE order_id = :id", :id => @order_id
    DB.execute "DELETE FROM OrderDetail WHERE order_id = :id", :id => @order_id
    reload
  end

  # Menambahkan item ke dalam order
  def add_item(item)
    trigger = @items.any? do |x|
      x.item_id == item.item_id
    end

    if trigger
      DB.execute "UPDATE OrderDEtail SET quantity=:qty WHERE order_id=:o_id AND item_id=:i_id",
      :qty => item.quantity, :o_id => @order_id, :i_id => item.item_id
    else
      DB.execute "INSERT INTO OrderDetail(order_id,item_id,quantity) VALUES(:o_id, :i_id, :qty)",
      :o_id => @order_id, :i_id => item.item_id, :qty => item.quantity
    end
    reload
  end

  # Menghapus item yang ada pada order id tertentu
  def remove_item(item)
    trigger = @items.any? do |x| 
      x.item_id == item.item_id
    end
    if trigger
      DB.execute "DELETE FROM OrderDetail WHERE order_id = :id AND item_id = :i_id",
      :id => @order_id, :i_id => item.item_id
    end
    reload
    puts "#{item.name} removed from Order ID No.#{@order_id}".green
  end 

  def update_status(status)
    DB.execute "UDPATE #{TABLE_NAME} SET status = :st WHERE order_id = :id", :st => status, :id => @order_id
    "Status sudah diperbarui".green
  end
end



class Items
  
  TABLE_NAME = 'Items'
  DB = SQLite3::Database.open 'cart.db'
  DB.results_as_hash = true

  attr_reader :item_id, :name, :price
  attr_accessor :items,:quantity

  def initialize(id = nil,quantity = 1, name, price) 
    @item_id = id
    @name    = name
    @price   = price
    @quantity = quantity
  end

  def self.all
    @items = []
    rs = DB.execute "SELECT * FROM #{TABLE_NAME}"
    rs.each do |item|
      @items << new(item['item_id'],1, item['name'], item['price'])
    end
    @items
  end

end