require_relative('../sql_runner.rb')
require_relative('./house.rb')

class Student

  attr_accessor :id, :house
  attr_reader :first_name, :last_name, :age

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"].to_i
    @house = options["house"]
    @id = options['id'].to_i if options['id'].to_i
    @house_id = options["house_id"]
  end

  def save()

    sql = "INSERT INTO students (first_name, last_name, age, house)
          VALUES
          (
          '#{@first_name}',
          '#{@last_name}',
          #{@age},
          '#{@house}'
          ) RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |student| Student.new(student)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i    

  end

 # '#{@house}',

  def self.all
    sql = "SELECT * FROM students;"
    returned_query = SqlRunner.run(sql)
    list_of_student_objects = returned_query.map {|student| Student.new(student)}
    return list_of_student_objects
  end

  def find_by_id
    sql = "SELECT * FROM students
          WHERE id = #{@id};"
    returned_query = SqlRunner.run(sql)
    returned_student = returned_query.map {|student| Student.new(student)}
    return returned_student
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE students SET
           (first_name, last_name, age, house) =
           ('#{@first_name}', '#{@last_name}', #{@age}, '#{@house}')
           WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def sorting_hat()
    sql = "SELECT * FROM houses;"
    returned_houses = SqlRunner.run(sql)
    returned_houses_objects_array = returned_houses.map {|house| House.new(house)}
    random_house = returned_houses_objects_array.sample
    @house = random_house.name
    @house_id = random_house.id.to_i
    update()
  end

end