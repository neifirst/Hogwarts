require_relative("../db/sql_runner")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']
  end



  def save()
    sql = "INSERT INTO students(first_name, last_name, house, age)
          VALUES($1, $2, $3, $4)
          RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    student = SqlRunner.run(sql, values).first
    @id = student['id'].to_i
  end

  def find_house()

    sql = "SELECT *
          FROM houses
          WHERE houses.id = $1"
    values = [@id]
    houses = SqlRunner.run(sql, values)
    return houses[0]

  end


  def self.find(id)
    sql = "SELECT *
          FROM students
          WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    return Student.new(student.first)
  end

  def self.all()
    sql = "SELECT *
          FROM Students"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map {|student| Student.new(student)}
    return result
  end


#   def update()
#     sql = "UPDATE students
#           SET (name, funds) = ($1, $2)
#           WHERE id = $3"
#     values = [@name, @funds, @id]
#     SqlRunner.run(sql, values)
#   end
#
#
#   def delete()
#     sql = "DELETE FROM students
#           WHERE id = $1"
#     values = [@id]
#     SqlRunner.run(sql, values)
#   end
#
#
#   def movies()
#
#     sql = "SELECT movies.*
#           FROM movies
#           INNER JOIN tickets
#           ON movies.id = tickets.movie_id
#           WHERE Student_id = $1;"
#     values = [@id]
#     movies = SqlRunner.run(sql, values)
#     return movies.map {|movie| Movie.new(movie)}
#
#   end
#
#
#   def tickets()
#
#     sql = "SELECT *
#           FROM tickets
#           WHERE Student_id = $1;"
#     values = [@id]
#     tickets = SqlRunner.run(sql, values)
#     return tickets.count
#
#   end
#
#

#
#
#   def self.delete_all()
#     sql = "DELETE FROM Students"
#     values = []
#     SqlRunner.run(sql, values)
#   end
#
end
