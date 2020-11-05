FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '全角' }
    first_name            { '全角' }
    last_name_kana        { 'ゼンカク' }
    first_name_kana       { 'ゼンカク' }
    birthday              { Faker::Date.in_date_period }
  end
end
