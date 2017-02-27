#Rewrite the each() method that prints all students using "while" or "until" control flow methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Using "while" I can do it this way:
# def printer(students)
#   count = 0
#   while count < students.count
#     puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
#     count += 1
#   end
# end

# Using "until" I could do it this way:
def printer(students)
  cloned_students = students.clone #I used students.clone as I was returning 0 on my counter at the bottom, as the shift was pulling everything out of my array so I had 0. I made the clone so I could pull everything out of it without disturbing the original array, so I could still do my count at the end. 
  until cloned_students.empty?
    student = cloned_students.shift #I used shift rather than pop to keep them in order as I had used pop first off and everything was backwards
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

students = input_students
print_header
printer(students)
print_footer(students)
