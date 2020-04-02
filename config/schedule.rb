set :environment, ENV["RAILS_ENV"]

every 1.day, at: '03:00' do
  rake 'jobs:get'
end

