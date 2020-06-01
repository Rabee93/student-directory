def input_students
  puts "please enter the names of the students"
  puts "to finish just hit, return twice"
# create an empty array
 students = []
 # get the first name
 name = gets.chomp
 # while the name is not empty, repeat this code
 while !name.empty? do
   # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    name = gets.chomp 
 end 
  students
end 

def print_header
  puts "The students of villains academy"
  puts "--------------"
end 
def print(students)
  students.each do |s| puts "#{s[:name]} (#{s[:cohort]} cohort)" end 
end 
# finally we print the total
def print_footer(names)
  puts " Overall we have #{names.count} great students"
end 
# nothing happens until we call a method.
students = input_students 
print_header 
print(students)
print_footer(students)
