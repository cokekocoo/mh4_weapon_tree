# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yaml = YAML.load_file(Rails.root + "lib/twin_swords.yml")

yaml.each do |key, value|
  sword = TwinSword.new(name: key)
  sword.assign_attributes(value)
  sword.save!
end
