# Buat sebuah class yang bernama task
# dengan atribut nama tasknya dan deskripsinya
# Task.new('wash the car', 'description')
# task.name
# task.description

class Task
  def initialize(name,description)
    @name = name
    @description = description
  end
  def name
    @name
  end
  def description
    @description
  end
  def set_name(name)
    @name = name
  end
end

task = Task.new('wash the car', 'description')
puts task.name
puts task.description
puts task.set_name(name: 'learn ruby')
