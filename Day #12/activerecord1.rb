require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'database_activerecord.db'
  )

ActiveRecord::Schema.define do
  create_table :orders do |table|
    #table.integer :id #automatically create id primary key autoincrement
    table.integer  :order_number
    table.text     :status, default: 'onprocess'

    table.timestamps
  end unless ActiveRecord::Base.connection.table_exists?('orders')

  create_table :orders_items do |table|
    table.integer :order_id
    table.integer :item_id
    table.integer :quantity

    table.timestamps
  end unless ActiveRecord::Base.connection.table_exists?('orders_items')

  create_table :items do |table|
    #table.integer :id #automatically create id primary key autoincrement
    table.text    :name
    table.integer :price, default: 0

    table.timestamps
  end unless ActiveRecord::Base.connection.table_exists?('items')
end

# THE CLASSES
class Order < ActiveRecord::Base
  has_many :orders_items 
  has_many :items, through: :orders_items

   def add_item item
      # puts item.inspect
      # puts "order id = #{self.id} dan item id = #{item.id}"
      item_exist = self.orders_items.select { |xitem| xitem.item_id == item.id}
      order_item = OrdersItem.find_by(order_id: self.id, item_id: item.id)
      if item_exist.nil?
        puts 'tambahkan quantity'
      else
        puts 'insert baru'
      end
   end

   def remove_item item
   end
end

class OrdersItem < ActiveRecord::Base
  belongs_to :order 
  belongs_to :item 
end

class Item < ActiveRecord::Base
  has_many :orders_items
  has_many :orders, through: :orders_items
end


# NOTE: kalau class beda dengan tablenya gunakan table_name:
# Contoh:
# class Transactions < ActiveRecord::Base
#   table_name: orderdetails
# end
# class Anotherclass < ActiveRecord::Base
#   has_many :transactions, table_name: orderdetails
# end
