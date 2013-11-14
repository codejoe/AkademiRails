# require 'minitest/autorun'
# require 'securerandom'


class Task
	attr_reader :name, :state
  def initialize(todo)
  	@name  = todo
  	@state = "unfinish"
  	
  end 
  def finish!
  	@state = "finish"
  end
  def unfinish!
  	@state = "unfinish"
  end

end 


class List
	def initialize
		@list = []
	end

	def add(task)
		@list << task 
	end

	def look(what)
		@list.map{|task| task.name if task.state == what} 
  end

  def list
		@list.map{|task| task.name }
	end

	def uncomplete
		look("unfinish")
	end

	def complete
		look("finish")
	end
end

# class Testing < Minitest::Unit::TestCase
# 	def test_1
# 		t1 = Task.new('do1')
# 		assert_equal 'do1', t1.name
# 	end
# 	def test_finish_task
#     t1 = Task.new('do1')
#     assert_equal 'finish',t1.finish!
#   end
#   def test_unfinish_task
#     t1 = Task.new('do1')
#     assert_equal 'unfinish',t1.unfinish!
#   end
#   def test_add_to_list
#     t1 = Task.new('do1')
#     # t2 = Task.new('do2')
#     # t3 = Task.new('do3')
#     today = List.new
#     today.add(t1)
#     assert_equal ['do1'], today.list
#   end
#   def test_uncomplete
#     t3 = Task.new('do3')
#     t2 = Task.new('do2')
#     today = List.new
#     today.add(t3)
#     today.add(t2)
#     assert_equal ['do3','do2'], today.uncomplete
#   end
#   def test_complete
#     t2 = Task.new('do2')
#     t2.finish!
#     today = List.new
#     today.add(t2)
#     assert_equal ['do2'], today.complete
#   end
# end






# load 'todo3.rb'
# todo = todo.new
# todo.add task
# todo.list