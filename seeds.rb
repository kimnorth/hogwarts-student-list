require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./models/house.rb')

Student.delete_all()
House.delete_all()

# Houses

@gryffindor = House.new({"name" => "Gryffindor", "beast" => "Lion"})
@gryffindor.save

@slytherin = House.new({"name" => "Slytherin", "beast" => "snek"})
@slytherin.save

@hufflepuff = House.new({"name" => "Hufflepuff", "beast" => "Badger"})
@hufflepuff.save

@ravenclaw = House.new({"name" => "Ravenclaw", "beast" => "Raven"})
@ravenclaw.save

# Students

@student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "age" => 78, "house" => @gryffindor.name, "house_id" => @gryffindor.id})
@student1.save()

@student2 = Student.new({"first_name" => "Hermione", "last_name" => "Granger", "age" => 108, "house" => @ravenclaw.name})
@student2.save()

@student3 = Student.new({"first_name" => "Ron", "last_name" => "Weasley", "age" => 8, "house" => @slytherin.name})
@student3.save()

binding.pry
nil