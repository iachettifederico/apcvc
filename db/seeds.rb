# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.first_or_create!(email: ENV["DEFAULT_ADMIN_EMAIL"],
                       password: ENV["DEFAULT_ADMIN_PASSWORD"],
                       password_confirmation: ENV["DEFAULT_ADMIN_PASSWORD"])
