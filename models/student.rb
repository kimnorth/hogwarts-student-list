require_relative('../sql_runner.rb')

class Student

  attr_accessor :id

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house = options["house"]
    @age = options["age"].to_i
    @id = options['id'].to_i if options['id'].to_i
  end

  def save()

    sql = "INSERT INTO students (first_name, last_name, house, age)
          VALUES
          (
          '#{@first_name}',
          '#{@last_name}',
          '#{@house}',
          #{@age}
          ) RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |student| Student.new(student)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i    

  end

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

end