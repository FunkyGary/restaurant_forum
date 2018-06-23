namespace :dev do

  task fake_user: :environment do
    User.destroy_all

    20.times do |i|
      User.create!(email: FFaker::Internet.email,
        password: FFaker::Internet.password
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_commet: :environment do
    Commet.destroy_all

    3.times do |i|
      Commet.create!(content: FFaker::Lorem.paragraph,
        restaurant: Restaurant.all.sample,
        user: User.all.sample,
      )
    end
    puts "have created fake commets"
    puts "now you have #{Commet.count} commets data"
  end
end
