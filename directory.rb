require 'csv'

@months = ["january","february","march", "april","may", "june", "july", "august", "september", "october", "november", "december"]

def input_cohort
  cohort = STDIN.gets[0...-1]
  if cohort.empty?
    cohort = "november"
  end 
  until @months.include? cohort
    puts "try again"
    cohort = STDIN.gets[0...-1]
  end 
  return cohort
end 

def input_students
  puts "please enter the names of the students and then the cohort"
  puts "to finish just hit, return twice"
  name = STDIN.gets[0...-1]
  cohort = input_cohort
  while !name.empty? do
    add_student(name, cohort)
    print_footer
    name = STDIN.gets[0...-1]
    cohort = input_cohort
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
  try_load_students
  loop do 
    students_menu
    selection = STDIN.gets.chomp 
     process(selection)
    
  end 
end 

def students_menu
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save file"
  puts "4. Load the list from a file"
  puts "5. exit"
end 

def process(selection)
  case selection
    when "1"
      input_students 
    when "2"
      if @students.length > 0
        print_students
      else
        puts "There are no students"
      end 
    when "3"
     if @students.length > 0
       puts "what file do you want to save ?"
       file_name = STDIN.gets.chomp
       save_students(file_name)
     else
       puts "There are no students"
     end 
    when "4"
      puts "which file do you want to load ?"
      file_name = STDIN.gets.chomp
      load_students(file_name)
    
    when "5"
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

def save_students(filename = "students.csv")
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end 
  end
  puts "saved students"
end 

def load_students(filename = "students.csv")
  @students = []
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student(name, cohort)
  end
  puts "loaded students"
end

def try_load_students
  filename = ARGV.first 
  if filename.nil?
    filename = "students.csv"
  end 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end


def add_student(name, cohort)
@students << {name: name, cohort: cohort.to_sym}
end 

interactive_menu

