require './corrector'
require './classroom'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || of_age
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.classroom = self
  end
end
