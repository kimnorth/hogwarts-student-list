require('pry-byebug')
require_relative('./models/student.rb')

@student1 = Student.new({"first_name" => "Harry", "last_name" => "Potter", "house" => "Gryffindor", "age" => 78})
@student1.save()