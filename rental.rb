class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    book.students.push(self) unless book.students.include?(self)
  end

  def person=(person)
    @person = person
    person.students.push(self) unless person.students.include?(self)
  end
end
