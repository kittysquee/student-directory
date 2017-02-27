# Modify your program to only print the students whose name begins with a specific letter.
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# This is another way I could've done it.
# def print(students)
#   students.each_with_index do |student, index|
#     if student[:name].start_with?("E", "e")
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def printer(students)
  starts_with_e(students).each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def starts_with_e(students)
  students.select {|student| student[:name].start_with?("E", "e")}
end

def print_footer(names)
  puts "Overall, we have #{starts_with_e(names).count} great students beginning with 'E'"
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end
  students
end

students = input_students
print_header
printer(students)
print_footer(students)
