require_relative('../db/sql_runner.rb')

class House
attr_reader :name, :url, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @url = options['url']
  end

  def save
    sql ="INSERT INTO houses (name, url)
    VALUES ($1, $2)
    RETURNING *"
    values =[@name, @url]
    house = SqlRunner.run(sql, values)
    @id = house.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id=$1"
    values = [id]
    result = SqlRunner.run(sql, values)
    houses = House.new(result.first)
  end

  def self.find_all
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    houses = result.map{|house| House.new(house)}
    return houses
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end
