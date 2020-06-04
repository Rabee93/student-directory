
 months = ["january","february","march", "april","may", "june", "july", "august", "september", "october", "november", "december"]


def input_students(months)
  puts "please enter the names of the students and then the cohort"
  puts "to finish just hit, return twice"

 students = []
 name = gets[0...-1]
 cohort = gets[0...-1]
  
  while !name.empty? do
  if cohort.empty?
    cohort = "november"
  end 
  until months.include? cohort
    puts "try again"
    cohort = gets[0...-1]
  end 
    students << {name: name, cohort: cohort.to_sym, hobbies: :tennis, country_of_birth: :UK}
    print_footer(students) 
    name = gets[0...-1]
    cohort = gets[0...-1]
  end 
  students
end 

def print_header
  puts "The students of villains academy"
  puts "--------------"
end 
def print(students, letter)
  index = 0
  while index < students.length
    s = students[index] 
    if s[:name].start_with?(letter) && s[:name].length < 12
      puts "#{index + 1}.#{s[:name]} (#{s[:cohort]} cohort)".center(30)
    end
    index +=1
  end 
end 

def print_footer(names)
  students_count = names.count 
  if students_count == 1
    puts "Overall we have #{students_count} great student"
  else
  puts "Overall we have #{students_count} great students"
  end 
end 

students = input_students(months)
if students.length > 0
  print_header 
  group_students = []
  months.each do |m| 
  students.each do |s| 
    if s [:cohort] == m.to_sym
      group_students << s
    end 
  end 
end 
print(group_students, "s") 
print_footer(students)
end 