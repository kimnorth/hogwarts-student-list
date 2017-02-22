require('pry-byebug')
require_relative('./models/student.rb')

Student.delete_all()

@student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "house" => "Gryffindor", "age" => 78})
@student1.save()

@student2 = Student.new({"first_name" => "Hermione", "last_name" => "Granger", "house" => "Gryffindor", "age" => 108})
@student2.save()

@student3 = Student.new({"first_name" => "Ron", "last_name" => "Weasley", "house" => "Gryffindor", "age" => 8})
@student3.save()



binding.pry
nil