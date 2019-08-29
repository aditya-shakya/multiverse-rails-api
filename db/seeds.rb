# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Universe.destroy_all
Family.destroy_all
Person.destroy_all

universes = Universe.create([{name: 'Universe1'}, {name: 'Universe2'}, {name: 'Universe3'}])
families = Family.create([{name: 'Family1'}, {name: 'Family2'}, {name: 'Family3'}])
people = Person.create([
          {name: 'Person1', power: '-1', family_id: families.first.id, universe_id: universes.first.id},
          {name: 'Person2', power: '2', family_id: families.first.id, universe_id: universes.second.id},
          {name: 'Person3', power: '1', family_id: families.second.id, universe_id: universes.third.id},
          {name: 'Person4', power: '1', family_id: families.third.id, universe_id: universes.first.id},
          {name: 'Person5', power: '1', family_id: families.second.id, universe_id: universes.second.id},
          {name: 'Person6', power: '3', family_id: families.third.id, universe_id: universes.third.id}
         ])