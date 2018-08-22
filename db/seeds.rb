# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Language.destroy_all
I18nData.languages.values.each do |language|
	Language.create name: language
end

# create super admin of application
super_admin = User.find_or_create_by(email: 'admin@test.com')
super_admin.assign_attributes(
	username: 'admin',
	full_name: 'Super Admin',
	password: 'password',
	super_admin: true
)
super_admin.save!

tutor = User.find_or_create_by(email: 'tutor@test.com')
tutor.assign_attributes(
	username: 'Tutor',
	full_name: 'Tutor',
	password: '123123',
	activated: true,
	role: 1
)
tutor.save!

student = User.find_or_create_by(email: 'student@test.com')
student.assign_attributes(
	username: 'Student',
	full_name: 'Student',
	password: '123123',
	role: 0
)
student.save!