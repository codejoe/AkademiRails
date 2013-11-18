# Mini Active Records

require 'sqlite3'

class Task

  attr_accessor :id, :task_name, :date, :tags
  DB.result_as_hash = true
  
  def initialize(id, task_name, date, tags)
    # @db = SQLite3::Database.open 'todolist.db'
    @time = Time.now.to_s

    @id = id
    @task_name = task_name
    @date = date
    @tags = tags 
  end

  def create_db
    db_new = SQLite3::Database.new 'todolist.db'
  end

  def create_table
    table_new = "CREATE TABLE Task (Id integer primary key autoincrement, Task_name text)"
    @db.execute table_new
  end

  def self.list
    @db = SQLite3::Database.open 'todolist.db'
    list = "SELECT * FROM Task"
    @rows = []
    result = @db.execute list
    result.each do |id, task_name, date, tags| 
      @rows << new(id, task_name, date, tags)   
    end
    @rows
  end

  def save
    if id.nil?
      DB.execute "insert into #{TABLE_NAME} (name,date,tags) values (:name,:date,:tags)", 
        name: name, date: date, tags: tags
    else
      DB.execute "update #{TABLE_NAME} set name = :name, date = :date, tags = :tags where id = :id", 
        name: name, date: date, tags: tags, id: id
    end
  end

  def add(task_name, tags)
    insert = "INSERT INTO Task (Task_name, Date, Tags) values ('#{task_name}', '#{@time}','#{tags}') "
    @db.execute insert
  end

  def update(id, task_name)
    update = "UPDATE Task SET Task_name = '#{task_name}' where Id = '#{id}' "
    @db.execute update
  end

  def delete(id)
    delete = "DELETE FROM Task where Id = '#{id}' "
    @db.execute delete
  end
end