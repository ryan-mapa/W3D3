# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all

  User.create(email: '1@example.com')
  User.create(email: '2@example.com')
  User.create(email: '3@example.com')
  User.create(email: '4@example.com')
  User.create(email: '5@example.com')

  ShortenedUrl.destroy_all
  ShortenedUrl.create(user_id: 17, long_url: '1as;lfjals;df.com/stuff')
  ShortenedUrl.create(user_id: 18, long_url: '2as;lfjals;df.com/stuff')
  ShortenedUrl.create(user_id: 17, long_url: '3as;lfjals;df.com/stuff')

  Visit.create(user_id: 17, short_url_id: 10 )
  Visit.create(user_id: 18, short_url_id: 10 )  
end
