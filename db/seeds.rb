require_relative('../models/student.rb')
require_relative('../models/house.rb')

require("pry-byebug")

Student.delete_all()
House.delete_all()



  house1 = House.new({
    "name" =>"Gryffindor",
    "url" => "https://en.wikipedia.org/wiki/Hogwarts#Gryffindor"
    })

  house2 = House.new({
    "name" => "Hufflepuff",
    "url" => "https://en.wikipedia.org/wiki/Hogwarts#Hufflepuff"
    })

  house3 = House.new({
    "name" => "Ravenclaw",
    "url" => "https://en.wikipedia.org/wiki/Hogwarts#Ravenclaw"
    })

  house4 = House.new({
    "name" => "Slytherin",
    "url" => "https://en.wikipedia.org/wiki/Hogwarts#Slytherin"
    })



    house1.save()
    house2.save()
    house3.save()
    house4.save()
    houses = House.find_all
    house_found = House.find(house2.id)

  student1 = Student.new({
    "first_name" => "Harry",
    "last_name" => "Potter",
    "house" => house1.id,
    "age" => 16
    })

  student2 = Student.new({
    "first_name" => "Ron",
    "last_name" => "Weasley",
    "house" => house1.id,
    "age" => 16
    })

  student1.save()
  student2.save()
  students = Student.find_all
  student_found = Student.find(student1.id)
  # student_house = student1.houses_by_id(student1.id)



  binding.pry

nil
