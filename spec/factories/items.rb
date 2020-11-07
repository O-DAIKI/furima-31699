FactoryBot.define do
  factory :item do
    name             {Faker::Lorem.sentence}
    text             {Faker::Lorem.sentence}
    category_id      {1}
    condition_id     {1}
    shipping_fee_id  {1}
    shipping_from_id {1}
    shipping_day_id  {1}
    price            {3000}
    association :user
  end
end
