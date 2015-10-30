require "httparty"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#i
def movie_autofill(title)
  response = HTTParty.get("http://www.omdbapi.com/?t=#{title}&r=json")
  title = response["Title"]
end

#User.create!([{ 
# email: 'obama@google.com', password: 'password', password_confirmation: 'password',
#firstname: "Barack", lastname: "Obama" 
#}])
#User.create!([{ 
# email: 'lezah@google.com', password: 'password', password_confirmation: 'password', 
# firstname: "Lisa", lastname: "Chao" 
#}])

movie_autofill('harry+potter')
