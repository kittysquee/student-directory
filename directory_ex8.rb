# Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end



def printer(students)
  cohorts = students.map do |student| student[:cohort] end
  cohorts.uniq.each do |x|
  puts "#{x} cohort"
    students.each do |student|
      if student[:cohort] == x
        puts student[:name]
      end
    end
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
