
# lets put all students in an array.
students = [ "Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the west", "Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon", "Norman Bates"]


def print_header
puts "The students of villains academy"
puts "--------------"
end 
def print(names)
names.each do |s| puts s end 
end 
# finally we print the total
def print_footer(names)
puts " Overall we have #{names.count} great students"
end 
# nothing happens until we call a method.
print_header 
print(students)
print_footer(students)
