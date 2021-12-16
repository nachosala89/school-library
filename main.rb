require './person'
require './student'
require './teacher'
require './book'

def list_books
  $books.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def list_people
  $people.each do |person|
    puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  $books.push(book)
  puts 'Book created successfully!' if ($books.include?(book))
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  option = gets.chomp
  puts 'Age: '
  age = gets.chomp.to_i
  puts 'Name: '
  name = gets.chomp
  person = nil
  case option
  when "1"
    puts 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = (permission.downcase == 'y')
    person = Student.new(age, name, permission)
    $people.push(person)
  when "2"
    puts 'Specialization:'
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    $people.push(person)
  end
  puts 'Person created successfully!' if ($people.include?(person))
end

def create_rental
  puts 'Select a book from the following list by number: '
  $books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
  index_book = gets.chomp.to_i
  puts ''
  puts 'Select a person from the following list by number (not ID): '
  $people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  index_person = gets.chomp.to_i
  puts 'Date: '
  date = gets.chomp
  Rental.new(date, $books[index_book], $people[index_person])
end

def list_rentals
  print 'ID of the person: '
  id = gets.chomp.to_i
  rentals = $people.select{|person| person.id = id}.rentals
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
end

def display(option)
  case option
  when "1"
    list_books
  when "2"
    list_people
  when "3"
    create_person
  when "4"
    create_book
  when "5"
    create_rental
  when "6"
    list_rentals
  end
end

def main
  $books = []
  $people = []
  puts 'Welcome to School Library App!'
  puts ''
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person (teacher or student).'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person id.'
    puts '7 - Exit'
    option = gets.chomp
    break if (option == "7")
    display(option)
    puts ''
  end
end

main
