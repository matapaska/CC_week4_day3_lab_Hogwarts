require_relative('../db/sql_runner.rb')
require_relative('./house.rb')

class Student

  attr_reader :first_name, :last_name, :house, :age, :id


  def initialize( options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house'].to_i
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students(
      first_name,
      last_name,
      house,
      age)
      values
      ($1, $2, $3, $4)
      RETURNING *"
      values = [@first_name, @last_name, @house, @age]
      student = SqlRunner.run(sql, values)
      @id = student.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id=$1"
    values = [id]
    result = SqlRunner.run(sql, values)
    students = Student.new(result.first)
  end

  def houses_by_id
    sql = "SELECT houses.name FROM houses
    INNER JOIN students
    ON students.house = houses.id
    WHERE students.id = $1"
    values =[@id]
    return SqlRunner.run(sql, values)[0]['name']
  end


  def self.find_all
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    students = result.map {|student| Student.new(student)}
    return students
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


end
