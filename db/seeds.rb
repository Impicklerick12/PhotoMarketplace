# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'populator'

# Category.create(name:"Landscape")
# Category.create(name:"Wedding")
# Category.create(name:"Workshop")
# Category.create(name:"Print")
# Category.create(name:"Commercial")
# Category.create(name:"Portrait")

10.times do
    user=User.new(
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
    user.save!

    user.profile = Profile.create(
        name: Faker::Name.name,
        description: Faker::TvShows::GameOfThrones.quote
    )
    user.profile.save!

    # 4.times do
    #     user.profile.listings = Listing.create(
    #         title: "Photography Listing",
    #         description: "Photography Listing",
    #         price: 300,
    #         category_id: rand(1..6)
    #     )
    #     user.profile.listings.save!
    # end
end