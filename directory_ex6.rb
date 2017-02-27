# Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def printer(students)
  students.each do |student|
    puts "Name: #{student[:name].center(25)} Place of birth: #{student[:birth_country].center(25)} Height: #{student[:height].center(25)} Hobby: #{student[:hobby].center(25)} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def get_student_height
  puts "Please enter student height:"
  print_prompt
  gets.chomp
end

def country
  puts "Please enter country of birth of student:"
  print_prompt
  gets.chomp
end

def hobby
  puts "What is their favourite pasttime?"
  print_prompt
  gets.chomp
end

def print_prompt
  print "> "
end

def input_students
  puts "Please enter the information that is required for each student."
  puts "Name please:"
  print_prompt

  students = []

  name = gets.chomp

  country_of_birth = country

  height = get_student_height

  pasttime = hobby

  while !name.empty? do
    students << {name: name, cohort: :november, birth_country: country_of_birth, height: height, hobby: pasttime}
    puts "Now we have #{students.count} students"
    puts "Add another student name please or hit return if none to finish:"
    name = gets.chomp
    unless name.empty?
      country_of_birth = country
      height = get_student_height
      pasttime = hobby
    end
  end
  students
end

students = input_students
print_header
printer(students)
print_footer(students)
