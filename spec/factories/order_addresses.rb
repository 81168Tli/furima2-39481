FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    s_num { '1-1' }
    build_name { '東京ハイツ' }
    tel { 12345678911 }
    token {"tok_abcdefghijk00000000000000000"}


    
  end


end

