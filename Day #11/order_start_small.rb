#1 include sqlite3
require 'sqlite3'

#2 create class
class Order
  #6 create db and table
  TABLE_ORDER = 'Orders'
  DB = SQLite3::Database.open 'order_new.db'
  DB.results_as_hash = true # make results as hash not array

  #8 make accessor
  attr_accessor :id, :order_number, :date, :status

  #3 create initialize, what params needed
  def initialize(params = {})
    @id           = params[:id]
    @order_number = params[:order_number]
    @date         = params[:date] || Date.today.to_s # if nill = Date today (default)
    @status       = params[:status] || 'onprocess' # nil || true outputnya true
  end

  #4 class method, create array of objects
  def self.all
    #5 create query select
    query = "SELECT * FROM #{TABLE_ORDER}"
    results = DB.execute query

    #7 create array of objects
    results.inject([]) do |orders, row| # from hash to array, make default empty array []
      orders << new({ # make it objects
        id: row['id'],  # make symbol not array
        order_number: row['order_number'],
        date: row['date'],
        status: row['status']
        })
    end
  end

  #9 class save
  def save
    #12 check id for insert or update
    if id.nil? # id not variable but method from accessor
      #10 create query insert
      query = "INSERT INTO ", 
      DB.execute query, order_number: order_number, date: date, status: status # bind params with symbol
      #11 get last insert id
      self.id = DB.last_insert_row_id
      #@id = DB.last_insert_row_id
    else
      #13 create query update
      query = "UPDATE "
      DB.execute query, order_number: order_number, date: date, status: status, id: id # bind params with symbol
    end
    #14 return object itself
    self # return object itself
  end
end

# THIRD CLASS TO CREATE
class OrderItem

  TABLE_ORDER = 'OrderItems'
  DB = SQLite3::Database.open 'order_new.db'
  DB.results_as_hash = true 

  attr_accessor :id, :order_number, :date, :status

  def initialize(order_id, item_id, quantity = 1)
    @order_id = order_id
    @item_id  = item_id
    @quantity = quantity
  end

  def save

  end

  def add_item
    unless condition
    
    else

    end
    
  end
end

# SECOND CLASS TO CREATE
class Item
  #6 create db and table
  TABLE_ORDER = 'Items'
  DB = SQLite3::Database.open 'order_new.db'
  DB.results_as_hash = true # make results as hash not array

  #8 make accessor
  attr_accessor :id, :order_number, :date, :status

  #3 create initialize, what params needed
  def initialize(params = {})
    @id           = params[:id]
    @order_number = params[:order_number]
    @date         = params[:date] || Date.today.to_s # if nill = Date today (default)
    @status       = params[:status] || 'onprocess' # nil || true outputnya true
  end

  #4 class method, create array of objects
  def self.all
    #5 create query select
    query = "SELECT * FROM #{TABLE_ORDER}"
    results = DB.execute query

    #7 create array of objects
    results.inject([]) do |orders, row| # from hash to array, make default empty array []
      orders << new({ # make it objects
        id: row['id'],  # make symbol not array
        order_number: row['order_number'],
        date: row['date'],
        status: row['status']
        })
    end
  end

  #9 class save
  def save
    #12 check id for insert or update
    if id.nil? # id not variable but method from accessor
      #10 create query insert
      query = "INSERT INTO ", 
      DB.execute query, order_number: order_number, date: date, status: status # bind params with symbol
      #11 get last insert id
      self.id = DB.last_insert_row_id
      #@id = DB.last_insert_row_id
    else
      #13 create query update
      query = "UPDATE "
      DB.execute query, order_number: order_number, date: date, status: status, id: id # bind params with symbol
    end
    #14 return object itself
    self # return object itself
  end
end