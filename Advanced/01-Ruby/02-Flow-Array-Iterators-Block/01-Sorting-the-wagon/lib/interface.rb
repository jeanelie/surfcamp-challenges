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
if students.size > 1
  first_part = students.take(students.size - 1).join(", ")
  students_string = "#{first_part} and #{students.last}"
else
  students_string = students.first
end

puts "Congratulations! Your Wagon has #{students.size} students:
- #{students_string}"
