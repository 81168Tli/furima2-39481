FactoryBot.define do
  
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    lastname1               {Faker::Name.last_name.initials(number: 2)}
    firstname1              {Faker::Name.first_name.initials(number: 2)}
    lastname2               {Faker::Name.last_name.initials(number: 2)}
    firstname2              {Faker::Name.first_name.initials(number: 2)}
    birth                   {Date.new(1990, 1, 1) }

    
  end
end
