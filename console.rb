require_relative('models/student.rb')
require_relative('models/house.rb')

require( 'pry-byebug' )


house1 = House.new({'name' => 'Gryffindor', 'logo' => "https://goo.gl/images/P4wNX8"})
house1.save()
house2 = House.new({'name' => 'Slytherin', 'logo' => "fgantntr"})
house2.save()
house3 = House.new({'name' => 'Hufflepuff', 'logo' => "hgrssytjy"})
house3.save()
house4 = House.new({'name' => 'Ravenclaw', 'logo' => "hgrssytjy"})
house4.save()




student1 = Student.new({'first_name' => 'Harry', 'last_name' => 'Potter', 'house_id' => house2.id, 'age' => 12})
student1.save()

student2 = Student.new({'first_name' => 'Ron', 'last_name' => 'Weasley', 'house_id' => house1.id, 'age' => 12})
student2.save()

student3 = Student.new({'first_name' => 'Hermione', 'last_name' => 'Granger', 'house_id' => house3.id, 'age' => 12})
student3.save()





binding.pry
nil
