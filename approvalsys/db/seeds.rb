# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Role.delete_all
CSV.foreach("db/dump/roles.csv") do |row|
  Role.create(id: row[0], name: row[1], created_at: row[2], updated_at: row[3], code: row[4])
end

User.delete_all
User.create!(name: 'Admin', email: ENV["SMTP_EMAIL_USER_NAME"], password: 'password',role_id: 0)