FactoryBot.define do
  
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    content                 {"テスト"}
    price              { "300" }
    genre_id           { "3" }
    state_id              { "3" }
    deriver_cost_id             { "3" }
    prefecture_id              { "3" }
    deriver_day_id             { "3" }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end 


  end
end
