# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create email: "hung.dao@me.com", password: "12345678"
user.tickets.create(
  citation_number: "789456123", location: "123 Rando St", 
  license_number: "ABC123",
  fine_amount: 44.00,
  filepicker_url: "",
  status: Ticket::STATUS_PENDING
  issued_at: Time.now
  )
t.integer  "user_id"
t.string   "citation_number"
t.string   "location"
t.string   "license_number"
t.float    "fine_amount"
t.string   "filepicker_url"
t.string   "status"
t.datetime "issued_at"

