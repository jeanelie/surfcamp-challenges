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

  if (students.empty?)
    students_string = ""
  elsif (students.size == 1)
    students_string = students.first
  else
    students_string = students.slice(0...-1).join(", ") + " and " + students.last
  end

end

puts "Congratulations! Your Wagon has #{students.size} students:
- #{students_string}"
