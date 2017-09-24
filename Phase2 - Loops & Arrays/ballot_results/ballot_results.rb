#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

puts vote_results.inspect

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"
  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end
  puts ""
end

puts "How many people voted in precinct 1?"
precinct_one_votes = vote_results[0]
puts precinct_one_votes.inject(0) { |sum, votes| sum + votes }

puts "Who was the winning candidate in Precinct 4?"
precinct_four_votes = vote_results[3]
winner_index = nil
max_votes = 0
precinct_four_votes.each_with_index do |votes, index|
  if votes > max_votes
    max_votes = votes
    winner_index = index
  end
end
puts candidates[winner_index]

puts "How many people voted for Mary Sue?"
mary_votes = 0
vote_results.each do |precinct|
  mary_votes += precinct[0]
end
puts mary_votes

puts "How many people voted for Billy Joe?"
billy_votes = 0
vote_results.each do |precinct|
  billy_votes += precinct[2]
end
puts billy_votes

puts "How many people voted for Sally Jane?"
sally_votes = 0
vote_results.each do |precinct|
  sally_votes += precinct[1]
end
puts sally_votes

puts "How many people voted in total?"
total_votes = 0
vote_results.each do |precinct|
  precinct.each do |votes|
    total_votes += votes
  end
end
puts total_votes

puts "Who had the most votes?"
candidate_votes = [mary_votes, sally_votes, billy_votes]
total_winner_index = nil
winner_votes = 0
candidate_votes.each_with_index do |votes, index|
  if votes > winner_votes
    winner_votes = votes
    total_winner_index = index
  end
end
puts "#{candidates[total_winner_index]} had the most votes with #{winner_votes}!"
