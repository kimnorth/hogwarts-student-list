require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./models/house.rb')

Student.delete_all()
House.delete_all()

# Students

@student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "house" => "Gryffindor", "age" => 78})
@student1.save()

@student2 = Student.new({"first_name" => "Hermione", "last_name" => "Granger", "house" => "Gryffindor", "age" => 108})
@student2.save()

@student3 = Student.new({"first_name" => "Ron", "last_name" => "Weasley", "house" => "Gryffindor", "age" => 8})
@student3.save()

# Houses

@gryffindor = House.new({"name" => "Gryffindor", "beast" => "Lion"})
@gryffindor.save

@slytherin = House.new({"name" => "Slytherin", "beast" => "snek"})
@slytherin.save

@hufflepuff = House.new({"name" => "Hufflepuff", "beast" => "Badger"})
@hufflepuff.save

@ravenclaw = House.new({"name" => "Ravenclaw", "beast" => "Raven"})
@ravenclaw.save

binding.pry
nil