# Modify your program to only print the students whose name is shorter than 12 characters.

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Alternatively I could've done it like this:

# def printer(students)
#   students.each do |student|
#       if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def printer(students)
  short_name(students).each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def short_name(students)
  students.select {|student| student[:name].length < 12}
end

def print_footer(names)
  puts "Overall, we have #{short_name(names).count} great students whose names have less than 12 characters"
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

students = input_students
print_header
printer(students)
print_footer(students)
