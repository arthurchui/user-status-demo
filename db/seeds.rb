require 'factory_girl_rails'
require 'ffaker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

@default_statuses = YAML.load(File.read(File.expand_path('config/locales/statuses.en.yml')))['en']['statuses'].to_a

def random_status
  i = rand(@default_statuses.size)
  @default_statuses[i][1]
end

10.times do
  ActiveRecord::Base.transaction do
    user = FactoryGirl.create(:seed_user)
    status = Status.new(random_status)
    status.user = user
    status.save!
  end
end