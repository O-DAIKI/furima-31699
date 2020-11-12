FactoryBot.define do
  factory :address_order do
    postal_code { '222-2222' }
    prefecture_id { 1 }
    municipality { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '柳ビル103' }
    phone_num { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
