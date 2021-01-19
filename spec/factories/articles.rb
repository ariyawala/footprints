FactoryBot.define do
  factory :article do
    title    { Faker::Lorem.sentence }
    memo     { Faker::Lorem.sentence }
    place    { Faker::Lorem.sentence }
    date     { 2021-01-01 }
    
    association :user

    after(:build) do |article|
      article.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end
