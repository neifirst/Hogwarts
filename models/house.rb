require_relative("../db/sql_runner")

class House

  attr_reader :id
  attr_accessor :name, :logo

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end



  def save()
    sql = "INSERT INTO houses(name, logo)
          VALUES($1, $2)
          RETURNING id"
    values = [@name, @logo]
    house = SqlRunner.run(sql, values).first
    @id = house['id'].to_i
  end


  def self.find(id)
    sql = "SELECT *
          FROM houses
          WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    return House.new(house.first)
  end


  def self.all()
    sql = "SELECT *
          FROM houses"
    values = []
    houses = SqlRunner.run(sql, values)
    result = houses.map {|house| House.new(house)}
    return result
  end

end
