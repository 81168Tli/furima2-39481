FactoryBot.define do
  
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { "123abc" }
    password_confirmation {password}

    lastname1              { "山田" }
    firstname1             { "太郎" }
    lastname2              { "ヤマダ" }
    firstname2             { "タロウ" }
    birth                   {Date.new(1990, 1, 1) }

    
  end
end
