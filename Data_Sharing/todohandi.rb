require 'minitest/autorun'
 
class Task
  attr_reader :description, :finished_at
 
  def initialize(description)
    @description = description
    @finished_at = nil
  end
 
  def complete!
    @finished_at = Time.now
  end
 
  def complete?
    !!@finished_at
  end
 
  def incomplete?
    !complete?
  end
end
 
class List
  attr_reader :tasks
 
  def initialize
    @tasks = []
  end
 
  def add(task)
    @tasks << task
  end
 
  def incomplete
    @tasks.select { |task| task.incomplete? }
  end
 
  def complete
    @tasks.select { |task| task.complete? }
  end
end
 
 
class TodoListTest < MiniTest::Unit::TestCase
  def setup
    @task = Task.new 'something'
    @list = List.new
  end
 
  def test_task_description
    assert_equal 'something', @task.description
    assert_equal nil, @task.finished_at
  end
 
  def test_list_have_initial_tasks
    assert_equal 0, @list.tasks.size
  end
 
  def test_add_to_list
    @list.add(@task)
    assert_equal 1, @list.tasks.size
  end
 
  def test_task_complete!
    @task.complete!
    refute_nil @task.finished_at
    assert_equal true, @task.complete?
  end
 
  def test_task_complete?
    assert_equal false, @task.complete?
  end
 
  def test_list_incomplete_tasks
    @list.add(@task)
    assert_equal @list.incomplete, [@task]
  end
 
  def test_list_complete_tasks
    @list.add(@task)
    @task.complete!
    assert_equal @list.complete, [@task]
  end
end