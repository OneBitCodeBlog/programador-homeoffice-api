set :environment, ENV["RAILS_ENV"]

every 1.minute do
  rake 'jobs:get'
end

