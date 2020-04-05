FactoryBot.define do
  factory :job_key_word do
    association :job, strategy: :build
    association :key_word, strategy: :build
  end
end
