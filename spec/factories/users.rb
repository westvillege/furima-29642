FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' +Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '雅子' }
    family_name_furi      { 'タナカ' }
    first_name_furi       { 'マサコ' }
    birthday              { '2020-09-09' }
  end
end
