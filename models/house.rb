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

end