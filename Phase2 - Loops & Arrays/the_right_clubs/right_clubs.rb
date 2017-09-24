REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

readable_clubs = possible_club_selections.map do |club|
  club.to_s.gsub(/_/, ' ')
end

puts "*** Automated Golf Club Advice: ***"
readable_clubs.each do |club|
  puts "Use the #{club}!"
end

if possible_club_selections != :driver
  puts "WARNING! You will be without a driver!"
elsif possible_club_selections != :pitching_wedge
  puts "WARNING! You will be without a pitching wedge!"
elsif possible_club_selections != :putter
  puts "WARNING! You will be without a putter!"
end
