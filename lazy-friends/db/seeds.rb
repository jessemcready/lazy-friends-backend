require 'faker'


User.destroy_all
Group.destroy_all
UserGroup.destroy_all
Event.destroy_all

puts "MAKING USERS"
User.create([
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location:'51 Grove St, New York, NY, 10014'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location:'361 W 17th St, New York, NY, 10011' },
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '1031 Lexington Ave, New York, NY 10021'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '238 Malcolm X Blvd, New York, NY 10027'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '33-12 23rd Ave, Astoria, NY 11105'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '31-12 31st Ave, Astoria, NY 11106'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '4540 Center Blvd, Long Island City, NY 11109'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '3 Milton St, Brooklyn, NY 11222'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '166 S 4th St, Brooklyn, NY 11211'},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location: '514 Union St, Brooklyn, NY 11215'}
])
puts 'DONE MAKING USERS'


puts 'MAKING GROUPS'
Group.create([
{name:Faker::StarWars.specie},
{name:Faker::StarWars.specie},
{name:Faker::StarWars.specie}
])
puts 'DONE MAKING GROUPS'



puts 'MAKING USERGROUPS'
UserGroup.create([
{group_id:Group.first.id, user_id: User.all[0].id},
{group_id:Group.first.id, user_id:User.all[1].id},
{group_id:Group.first.id, user_id:User.all[2].id},
{group_id:Group.second.id, user_id:User.all[3].id},
{group_id:Group.second.id, user_id:User.all[4].id},
{group_id:Group.second.id, user_id:User.all[5].id},
{group_id:Group.last.id, user_id:User.all[6].id},
{group_id:Group.last.id, user_id:User.all[7].id},
{group_id:Group.last.id, user_id:User.all[8].id},
{group_id:Group.last.id, user_id:User.all[9].id}
])
puts 'DONE MAKING USERGROUPS'



puts 'MAKING EVENTS'
Event.create(
  {group_id: Group.first.id, date: Date.new, name:'Happy Hour'}
)
puts 'DONE MAKING EVENTS'
