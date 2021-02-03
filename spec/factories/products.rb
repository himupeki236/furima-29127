FactoryBot.define do
  factory :product do
    name              {Faker::Internet.username(specifier: 40..40)}
    describe          {Faker::Internet.username(specifier: 1000..1000)}
    price             {300}
    category_id       {2}
    state_id          {2}
    ship_charge_id    {2}
    prefectures_id    {2}
    ship_day_id       {2}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
