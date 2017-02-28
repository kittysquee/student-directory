#code from directory.rb

def interactive_menu
  students = []
  loop do
    #1. Print menu and asj user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" #no.9 as we'll be addign more items

    selection = gets.chomp #2. read input and save to variable
    case selection #3. do what user has asked
    when "1"
      students = input_students
    when "2"
      print_header
      printer(students)
      print_footer(students)
    when "9"
      exit #terminate program
    else
      puts "I don't know what you meant, try again."
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def printer(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

interactive_menu
