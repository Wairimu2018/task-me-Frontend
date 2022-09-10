desc 'drops the db, creates db, migrates db and populates sample data'
task setup: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
  Rake::Task['populate_with_sample_data'].invoke if Rails.env.development?
end

task populate_with_sample_data: :environment do
  # create_sample_data!
  puts 'Seeding with sample data...'
  user_attributes = {email: 'wairimu@example.com', name: 'Wairimu', password: 'welcome', password_confirmation: 'welcome' }
  User.create! user_attributes
  puts 'Done! Now you can login with either "wairimu@example.com" or "mary@example.com", using password "welcome"'
end