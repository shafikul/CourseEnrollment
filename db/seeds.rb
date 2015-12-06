# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.create!(email:'sa@gm.com', password:'12345678', password_confirmation: '12345678')
# User.create!(email:'saa@gm.com', password:'12345678', password_confirmation: '12345678')
# User.create!(email:'sas@gm.com', password:'12345678', password_confirmation: '12345678')
# User.create!(email:'sss@gm.com', password:'12345678', password_confirmation: '12345678')

Semester.create(name: 'Term1', semester_type: 'fall');
Semester.create(name: 'Term2', semester_type: 'winter');
Semester.create(name: 'Term3', semester_type: 'summer');
Semester.create(name: 'Term4', semester_type: 'fall');

Course.create(name: 'PHY', course_no: 'CSE-104');
Course.create(name: 'ENG', course_no: 'ENG-101');
Course.create(name: 'MATH', course_no: 'MATH-205');
Course.create(name: 'ECO', course_no: 'ECO-101');
Course.create(name: 'SCO', course_no: 'CSE-201');
Course.create(name: 'JAVA', course_no: 'CSE-231');





