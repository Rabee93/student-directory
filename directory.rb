@months = ["january","february","march", "april","may", "june", "july", "august", "september", "october", "november", "december"]


def input_students
  puts "please enter the names of the students and then the cohort"
  puts "to finish just hit, return twice"

 
 name = gets[0...-1]
 cohort = gets[0...-1]
  
  while !name.empty? do
    if cohort.empty?
    cohort = "november"
    end 
    until @months.include? cohort
    puts "try again"
    cohort = gets[0...-1]
    end 
    @students << {name: name, cohort: cohort.to_sym, hobbies: :tennis, country_of_birth: :UK}
    print_footer
    name = gets[0...-1]
    cohort = gets[0...-1]
  end 
end 

def print_header
  puts "The students of villains academy"
  puts "--------------"
end 
def print_students_list(students, letter)
  index = 0
  while index < students.length
    s = students[index] 
    if s[:name].start_with?(letter) && s[:name].length < 12
      puts "#{index + 1}.#{s[:name]} (#{s[:cohort]} cohort)".center(30)
    end
    index +=1
  end 
end 

def print_footer
  students_count = @students.count 
  if students_count == 1
    puts "Overall we have #{students_count} great student"
  else
  puts "Overall we have #{students_count} great students"
  end 
end 
 
def group_of_students
  group_students = []
      @months.each do |m| 
        @students.each do |s| 
          if s [:cohort] == m.to_sym
            group_students << s
          end 
        end 
      end
    return group_students  
end 
def interactive_menu
  @students = []
  loop do 
    students_menu
    selection = gets.chomp 
     process(selection)
    
  end 
end 

def students_menu
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save file"
  puts "4. exit"
end 

def process(selection)
  case selection
    when "1"
      input_students 
    when "2"
      if @students.length > 0
        print_students
      end 
    when "3"
     save_students
    when "4"
      exit
    else
      puts "try again"
  end 
end 

 def print_students
  print_header 
  group_students = group_of_students
  print_students_list(group_students, "s")
  print_footer
 end 

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end 

interactive_menu