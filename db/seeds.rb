# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.destroy_all
Admin.create(
	email: 'website@dnbc.org',
	password: 'LifeTogether'
)

Alert.destroy_all
Alert.create(
	name: 'Sunday, Febuary 15',
	description: 'Because of something the schedule for will be different',
	active: false
)
