# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Mentoring.destroy_all
User.destroy_all
Event.destroy_all
Volunteer.destroy_all
Student.destroy_all

@Mentoring1 = Mentoring.create!(first_name: "Otis", last_name: "Guess", email: "guess01325@gmail.com", how_many: 5, school_district: "New London")

 @user1 = User.create!(username: "guess01325", name: "Otis Guess", email: "guess01325@gmail.com", password: "Gu145012")

 @user2 = User.create!(username: "sasha20", name: "Saschia Johnson", email: "saschia.johsnon@gmail.com", password: "Iyamxcited2024")

 @event1 = Event.create!(name:"Robocop", place: "library", date: "10/81/1986", time: "5:00pm", user: @user1 )

 @volunteer1 = Volunteer.create!(first_name:"Otis", last_name: "guess", email:"guess01325@yahoo.com", message:"Looking to volunteer sometimes", user: @user1, event: @event1)

 @student1 = Student.create!(name: "Otis Guess", address: "195 Garfield ave", contact: "860-303-0187", user: @user1, event: @event1)

 @registered = Registration.create!(first_name: "Otis", last_name: "Guess", email: "guess01325@gmail.com", how_often: "sometimes")


 puts "#{Registration.count} Registration created"
 puts "#{User.count} Users created"
 puts "#{Event.count} Event created"
 puts "#{Volunteer.count} Volunteer created"
 puts "#{Student.count} Student created"
puts "#{Mentoring.count} Mentoring created"
