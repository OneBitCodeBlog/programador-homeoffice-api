# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Job.create!(
  title: 'Desenvolvedor Full Stack Rails',
  description: Faker::Lorem.paragraph,
  job_link: Faker::Internet.url,
  published_date: Faker::Date.between(from: 2.days.ago, to: Date.today)
)

Job.create!(
  title: 'Desenvolvedor Full Stack Ruby on Rails',
  description: Faker::Lorem.paragraph,
  job_link: Faker::Internet.url,
  published_date: Faker::Date.between(from: 2.days.ago, to: Date.today)
)

KeyWord.create!(
  tag: 'Rails'
)

JobKeyWord.create!(
  job: Job.find(1),
  key_word: KeyWord.find(1)
)

JobKeyWord.create!(
  job: Job.find(2),
  key_word: KeyWord.find(1)
)