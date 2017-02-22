require_relative('../sql_runner.rb')

class Student

  attr_accessor :id, :house
  attr_reader :first_name, :last_name, :age

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"].to_i
    @house = options["house"]
    @id = options['id'].to_i if options['id'].to_i
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

  def alter_table()

  end

  # def find_house()
  #   sql = "SELECT * FROM houses
  #         INNER JOIN students_houses ON houses(id)
  #         WHERE student_id = #{@id};"
  #   result = SqlRunner.run(sql)
  #   resultobject = result.map { |house| House.new(house)}
  #   return resultobject
  # end

end