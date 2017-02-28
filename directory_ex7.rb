# In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort?
# What if one of the values is empty?
# Can you supply a default value?
# The input will be given to you as a string?
# How will you convert it to a symbol?
# What if the user makes a typo?

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

def get_cohort
  puts "Please enter cohort or hit return twice to finish:"
  print "> "
    input = gets.chomp
    if input.empty?
      :unknown
    else
      input.to_sym
    end
end

def input_students

  students = []

  puts "Please enter student name:"
  name = gets.chomp

  cohort = get_cohort

  while !name.empty? do
    puts "Are you sure you happy the details are correct? Save yes (y) or no (n)?"
    choice = gets.chomp
    if choice == "y"
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
    end

    puts "Name please:"
    name = gets.chomp
    unless name.empty?
      cohort = get_cohort
    end
  end
  students
end

students = input_students
print_header
printer(students)
print_footer(students)
