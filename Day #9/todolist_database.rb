# get all database
# insert
# update
# delete

require 'sqlite3'

class Todo
  def initialize
    @db = SQLite3::Database.open 'todolist.db'
  end

  def create_db
    db_new = SQLite3::Database.new 'todolist.db'
  end

  def create_table
    table_new = "CREATE TABLE Task (Id integer primary key autoincrement, Task_name text)"
    @db.execute table_new
  end

  def list(id = nil)
    if id == nil
      list = "SELECT * FROM Task"
    else
      list = "SELECT * FROM Task WHERE Id = '#{id}' "
    end 
    @db.execute list
  end

  def add(task_name)
    insert = "INSERT INTO Task (Task_name) values ('#{task_name}') "
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
task = Todo.new
#todo.create_db
#todo.create_table
