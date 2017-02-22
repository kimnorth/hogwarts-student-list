class House

  attr_reader :name,:beast
  attr_accessor :id

  def initialize(options)
    @name = options['name']
    @beast = options['beast']
    @id =options['id'] if options['id']
  end

  def save
    sql = "INSERT INTO houses 
    (name,beast)
    VALUES
    (
    '#{@name}',
    '#{@beast}') 
    RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map {|house| House.new(house)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def self.all
    sql = "SELECT * FROM houses;"
    returned_query = SqlRunner.run(sql)
    list_of_house_objects = returned_query.map {|house| House.new(house)}
    return list_of_house_objects
  end

  def self.delete_all()
    sql ="DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end