# The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Select a file to save to"
  puts "4. Select a file to load from"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def select_file
  puts "Please enter file name:"
  filename = STDIN.gets.chomp
end

def process(selection)
  case selection
  when "1"; input_students
  when "2"; show_students
  when "3"; save_students
  when "4"
    load_students
    puts "Loading students"
  when "9"; exit
  else
    puts "I don't know what you meant, try again."
  end
end

def student_info_input(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  until name.empty? do
    student_info_input(name)
    puts "Now we have #{student_counter} students"
    name = STDIN.gets.chomp
  end
end

def load_students(filename = select_file)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    student_info_input(name, cohort.to_sym)
  end
  file.close
end

def student_counter
  @students.count
end

def show_students
  print_students_header
  print_students_list
  print_students_footer
end

def print_students_header
  puts "The students of Villains Academy"
  puts "-" * 13
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_footer
  puts "Overall, we have #{student_counter} great students"
end

def save_students
  filename = select_file
  file = File.open(filename, "w")
  @students.each do |student|
    file.puts "#{student[:name]},#{student[:cohort]}"
  end
  puts "Student data saved"
  file.close
end

def try_load_students
  filename = ARGV.first
    return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{student_counter} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
