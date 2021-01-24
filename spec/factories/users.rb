FactoryBot.define do
  factory :user do
    nickname              {"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    password_confirmation {password}
    name_sei              {"アあ阿"}
    name_mei              {"アあ阿"}
    name_kana_sei         {"ヤマダ"}
    name_kana_mei         {"タロウ"}
    birth_date            {'1992/10/01'}
  end
end