class House

  attr_reader :name,:beast
  attr_accessor :id

  def initialize(options)
    @id =options['id'] if options['id']
    @name = options['name']
    @beast = options['beast']
  end

  def save
    sql = 

end