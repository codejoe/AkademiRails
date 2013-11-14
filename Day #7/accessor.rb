class Person
  attr_accessor :name

  def initialize name
    @name = name
  end

  def change_name
    @name = '12345'
  end

  def show_name
    name
  end
end

person = Person.new '998708'

person.change_name
puts person.name

person.name = '35345'
puts person.name