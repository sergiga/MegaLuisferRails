# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

description = ComponentDesc.create(
	componentType: 0,
	brand: Faker::Name.name,
	model: Faker::Name.name,		
	features: Faker::ChuckNorris.fact,
	alert: 0
)
description.components.create(
	status: Faker::Number.digit
	)

2.times do 
	rng_description = ComponentDesc.create(
		componentType: 0,
		brand: Faker::Name.name,
		model: Faker::Name.name,
		features: Faker::ChuckNorris.fact,
		alert: 2
		)

	rng_description.components.create(
	status: Faker::Number.digit
	)

end