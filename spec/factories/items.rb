FactoryBot.define do
  
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    content                 {"テスト"}
    price              { "" }
    genre_id           { "3" }
    state_id              { "3" }
    deriver_cost_id             { "3" }
    prefecture_id              { "3" }
    deriver_day_id             { "3" }
    user_id { "1" }
    
  end
end
