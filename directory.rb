
# lets put all students in an array.
students = [{name: "Dr. Hannibal Lecter", cohort: :november}, {name: "Darth Vader", cohort: :november}, {name: "Nurse Ratched", cohort: :november}, {name: "Michael Corleone", cohort: :november}, {name: "Alex DeLarge", cohort: :november}, {name: "The Wicked Witch of the west", cohort: :november}, {name: "Terminator", cohort: :november}, {name: "Freddy Krueger", cohort: :november}, {name: "The Joker", cohort: :november}, {name: "Joffrey Baratheon", cohort: :november}, {name: "Norman Bates", cohort: :november}]


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
print_header 
print(students)
print_footer(students)
