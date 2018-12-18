require 'faker'


User.destroy_all
Group.destroy_all
UserGroup.destroy_all
Event.destroy_all

puts "MAKING USERS"
User.create([
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location:'51 Grove St, New York, NY, 10014', username: 'user1', password: 'google12345', coordinates: '40.755, -73.972586', profile_url: Faker::Fillmurray.image},
{name:Faker::LordOfTheRings.character, email:Faker::Internet.free_email, location:'361 W 17th St, New York, NY, 10011', username: 'user2', password: 'google12345', coordinates: '40.689550, -73.988260', profile_url: Faker::Fillmurray.image },
{name:Faker::Seinfeld.character, email:Faker::Internet.free_email, location: '1031 Lexington Ave, New York, NY 10021', username: 'user3', password: 'google12345', coordinates: '40.776277, -73.955598', profile_url: Faker::Fillmurray.image},
{name:Faker::Seinfeld.character, email:Faker::Internet.free_email, location: '238 Malcolm X Blvd, New York, NY 10027', username: 'user4', password: 'google12345', coordinates: '40.719206, -73.874849', profile_url: Faker::Fillmurray.image},
{name:Faker::Lebowski.character, email:Faker::Internet.free_email, location: '33-12 23rd Ave, Astoria, NY 11105', username: 'user5', password: 'google12345', coordinates: '40.789875, -73.821785', profile_url: Faker::Fillmurray.image},
{name:Faker::Lebowski.character, email:Faker::Internet.free_email, location: '31-12 31st Ave, Astoria, NY 11106', username: 'user6', password: 'google12345', coordinates: '40.794126, -73.968919', profile_url: Faker::Fillmurray.image},
{name:Faker::BojackHorseman.character, email:Faker::Internet.free_email, location: '4540 Center Blvd, Long Island City, NY 11109', username: 'user7', password: 'google12345', coordinates: '40.809181, -73.946095', profile_url: Faker::Fillmurray.image},
{name:Faker::BojackHorseman.character, email:Faker::Internet.free_email, location: '3 Milton St, Brooklyn, NY 11222', username: 'user8', password: 'google12345', coordinates: '40.706431, -73.956169', profile_url: Faker::Fillmurray.image},
{name:Faker::BojackHorseman.character, email:Faker::Internet.free_email, location: '166 S 4th St, Brooklyn, NY 11211', username: 'user9', password: 'google12345', coordinates: '40.666499, -73.981903', profile_url: Faker::Fillmurray.image},
{name:Faker::BojackHorseman.character, email:Faker::Internet.free_email, location: '514 Union St, Brooklyn, NY 11215', username: 'user10', password: 'google12345', coordinates: '40.767122, -73.928896', profile_url: Faker::Fillmurray.image}
])
puts 'DONE MAKING USERS'


puts 'MAKING GROUPS'
Group.create([
{name: Faker::Cat.registry, suggestions: 'bar', description: Faker::RickAndMorty.quote},
{name: Faker::Cat.registry, suggestions: 'cafe', description: Faker::RickAndMorty.quote},
{name: Faker::Cat.registry, suggestions: 'movie_theater', description: Faker::Seinfeld.quote},
{name: Faker::Cat.registry, suggestions: 'restaurant', description: Faker::Seinfeld.quote},
{name: Faker::Cat.registry, suggestions: 'night_club', description: Faker::Lebowski.quote},
{name: Faker::Cat.registry, suggestions: 'bar', description: Faker::Lebowski.quote},
{name: Faker::Cat.registry, suggestions: 'bar', description: Faker::BojackHorseman.quote},
{name: Faker::Cat.registry, suggestions: 'cafe', description: Faker::BojackHorseman.quote},
{name: Faker::Cat.registry, suggestions: 'restaurant', description: Faker::Community.quotes},
{name: Faker::Cat.registry, suggestions: 'restaurant', description: Faker::Community.quotes}
])
puts 'DONE MAKING GROUPS'



puts 'MAKING USERGROUPS'
UserGroup.create([
{group_id:Group.all[0].id, user_id: User.all[0].id},
{group_id:Group.all[0].id, user_id: User.all[1].id},
{group_id:Group.all[0].id, user_id: User.all[2].id},
{group_id:Group.all[0].id, user_id: User.all[3].id},
{group_id:Group.all[0].id, user_id: User.all[4].id},
{group_id:Group.all[0].id, user_id: User.all[5].id},
{group_id:Group.all[1].id, user_id: User.all[0].id},
{group_id:Group.all[1].id, user_id: User.all[4].id},
{group_id:Group.all[1].id, user_id: User.all[8].id},
{group_id:Group.all[1].id, user_id: User.all[6].id},
{group_id:Group.all[2].id, user_id: User.all[6].id},
{group_id:Group.all[2].id, user_id: User.all[0].id},
{group_id:Group.all[2].id, user_id: User.all[2].id},
{group_id:Group.all[3].id, user_id: User.all[7].id},
{group_id:Group.all[3].id, user_id: User.all[6].id},
{group_id:Group.all[3].id, user_id: User.all[3].id},
{group_id:Group.all[4].id, user_id: User.all[8].id},
{group_id:Group.all[4].id, user_id: User.all[1].id},
{group_id:Group.all[5].id, user_id: User.all[9].id},
{group_id:Group.all[5].id, user_id: User.all[5].id},
{group_id:Group.all[5].id, user_id: User.all[3].id},
{group_id:Group.all[6].id, user_id: User.all[4].id},
{group_id:Group.all[6].id, user_id: User.all[5].id},
{group_id:Group.all[6].id, user_id: User.all[6].id},
{group_id:Group.all[6].id, user_id: User.all[7].id},
{group_id:Group.all[7].id, user_id: User.all[8].id},
{group_id:Group.all[7].id, user_id: User.all[9].id},
{group_id:Group.all[7].id, user_id: User.all[0].id},
{group_id:Group.all[8].id, user_id: User.all[1].id},
{group_id:Group.all[8].id, user_id: User.all[2].id},
{group_id:Group.all[8].id, user_id: User.all[3].id},
{group_id:Group.all[9].id, user_id: User.all[4].id},
{group_id:Group.all[9].id, user_id: User.all[5].id},
])
puts 'DONE MAKING USERGROUPS'



puts 'MAKING EVENTS'
Event.create(
  {group_id: Group.first.id, date: Date.new, name:'Happy Hour'}
)
puts 'DONE MAKING EVENTS'
