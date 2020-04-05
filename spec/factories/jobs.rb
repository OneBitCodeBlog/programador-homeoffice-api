FactoryBot.define do
  factory :job do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    job_link { Faker::Internet.url }
    published_date { Date.today }
  end
end
