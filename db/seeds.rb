# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Location.delete_all
Department.delete_all
Patient.delete_all
Provider.delete_all
Appointment.delete_all

admin_1 = User.create(
  first_name: 'Roy', last_name: 'Trenneman',
  username: 'roy_trey', email: 'roytrey@gmail.com',
  password: 'qwerty', password_confirmation: 'qwerty',
  is_admin: true
  )

ashby = Location.create(
  name: 'Ashby Medical Center',
  street_address: '1002 Healthcare Dr',
  city: 'Portland', state: 'OR', zip_code: '97266'
  )

community_hospital = Location.create(
  name: 'Community Hospital',
  street_address: '304 Willows St',
  city: 'Portland', state: 'OR', zip_code: '97349'
  )

ashby_primary = Department.create(name: 'Family Medicine',phone_number: 4155551200)
community_primary = Department.create(name: 'Family Medicine',phone_number: 4155551312)

ashby.departments << ashby_primary
community_hospital.departments << community_primary

# Creates patient-users Gene and Ellen. Gene is Ellen's guardian.
gene = User.create(
  first_name: 'Gene', last_name: 'Ross',
  username: 'gene',
  email: 'gross@example.com',
  password: 'qwerty123456', password_confirmation: 'qwerty123456',
  sex: 'male'
  )
gene.patient = Patient.create(
  dob: Date.new(1939, 12, 5),
  gender: 'male',
  ethnicity: 'Native American',
  language: 'English',
  phone_number: '4155551229',
  street_address: '17 Daws Road', street_address_2: 'Apt 101', city: 'Portland', state: 'OR',
  zip_code: 10001,
)
dr_venktaraman = User.create(
  first_name: 'Joseph', last_name: 'Venktaraman',
  username: 'venktaramanj',
  email: 'venktaramanj@ashby.org',
  password: 'qwerty123456', password_confirmation: 'qwerty123456'
  )
dr_venktaraman.provider = Provider.create

ellen = User.create(
  first_name: 'Ellen', last_name: 'Ross',
  username: 'ellen',
  email: 'eross@example.com',
  password: 'qwerty123456', password_confirmation: 'qwerty123456',
  sex: 'female'
  )
gene.patient.wards << ellen.patient = Patient.create(
  dob: Date.new(1940, 3, 7),
  gender: 'female',
  ethnicity: 'Asian',
  language: 'English',
  allergies: {penicillin: {severity: 4, symptoms: 'hives'}, codeine: {severity: 3, symptoms: 'shortness of breath'}, bee_stings: {severity: 5, symptoms: 'anaphylactic shock'}},
  phone_number: '4155551229',
  street_address: '17 Daws Road', street_address_2: 'Apt 101', city: 'Portland', state: 'OR',
  zip_code: 10001, pcp: dr_venktaraman.provider
  )

gall_bladder_app1 = Appointment.create(
  subject: 'Gall Bladder Surgery', provider: dr_venktaraman.provider,
  patient: ellen.patient, department: ashby_primary,
  scheduled_time: DateTime.new(2012,3,2,9)
  )
