require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  # TODO: Add the name we just gotto the students array
  students << name unless name.empty?

end while name != ""

# TODO: Call `wagon_sort` method and display the sorted student list
students = wagon_sort(students)

students_string = ""
students.each_with_index do |student, index|

  if index == students.size - 2
    students_string += student + " and "
  elsif index == students.size - 1
    students_string += student
  else
    students_string += student + ", "
  end

end

puts "Congratulations! Your Wagon has #{students.size} students:
- #{students_string}"
