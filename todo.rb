# TO DO LIST
# Gunakan method ARGV
# Gunakan juga method write to file

class Todo 
  def add(task)
    write = File.open("temp.dat", "a")
    write.puts task
    write.close
    puts task
  end

  def list
    File.read("temp.dat")
  end
end


if ARGV.first == 'add'
  Todo.new.add(ARGV.last)
elsif ARGV.first == 'list'
  puts Todo.new.list
end

# BETTER CODE
# class Task
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end
# class Storage
#   def initialize(tasks)
#     @tasks = tasks
#   end
#   def tasks
#     @tasks = File.read('todo2.txt')
#   end
#   def add(task)
#     @tasks << task
#     File.open('todo2.txt', 'a') do |f|
#       f.puts task.name
#     end
#   end
# end
# command = ARGV.first
# list = List.new([])
 
# if command == "list"
#   puts list.tasks
# elsif command == "add"
#   task_name = ARGV.last
#   list.add(Task.new(task_name))
# end