#We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).

# We could just use "chop" but that doesn't seem complex enough for the problem being posed here.
#I'm using the code from exercise 8 to see if it messes with the symbol -no.
#I used a gsub to strip off the \n character (remember the machine sees it as one and not two characters -special innit?) and replace it with an empty string.
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
    input = gets.gsub("\n", "")
    if input.empty?
      :unknown
    else
      input.to_sym
    end
end

def input_students

  students = []

  puts "Please enter student name:"
  name = gets.gsub("\n", "")

  cohort = get_cohort

  while !name.empty? do
    puts "Are you sure you happy the details are correct? Save yes (y) or no (n)?"
    choice = gets.gsub("\n", "")
    if choice == "y"
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
    end

    puts "Name please:"
    name = gets.gsub("\n", "")
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
