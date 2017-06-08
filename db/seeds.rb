# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
students = Student.create([{name: "Matt", bio:"Matt's  bio", gpa: 4.0, school: 'Clark'}, {name: "Sam", bio: "Sam's Bio",gpa: 2.0, school: "Amherst"}])

recruiters = Recruiter.create([{name: "Alex",bio: "alex's bio", school: "Yale"},{name: "Arthur", bio:"arthur's bio", school: "Yale"}])

users = User.create([
	{email: "matt@gbx.com",password: "qweqwe", password_confirmation: "qweqwe", meta_id: 1, meta_type: "Student"},
	{email: "sam@gbx.com", password: "qweqwe", password_confirmation: "qweqwe", meta_id: 2, meta_type: "Student"},
	{email: "alex@gbx.com", password: "qweqwe", password_confirmation: "qweqwe", meta_id: 1, meta_type: "Recruiter"},
	{email: "arthur@gbx.com", password: "qweqwe", password_confirmation: "qweqwe", meta_id: 2, meta_type: "Recruiter"}])
