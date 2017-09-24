# require "pry"
#Array index = course hole; key = par; value = strokes
scorecard = [
  { 5 => 7 },
  { 4 => 5 },
  { 3 => 3 },
  { 4 => 4 },
  { 4 => 4 },
  { 3 => 2 },
  { 4 => 5 },
  { 5 => 5 },
  { 4 => 5 },
  { 5 => 7 },
  { 4 => 4 },
  { 4 => 4 },
  { 3 => 3 },
  { 4 => 5 },
  { 4 => 5 },
  { 4 => 4 },
  { 3 => 3 },
  { 5 => 6 }
]
strokes_total = 0
par_total = 0
scorecard.each do |course_hole|
  course_hole.each do |par, strokes|
    par_total += par
    strokes_total += strokes
    # binding.pry
  end
end
puts "Total Strokes: #{strokes_total}"
puts "Total Par: #{par_total}"
difference = strokes_total - par_total
if difference >= 0
  puts "You were #{difference} over par."
else
  puts "You were #{difference * -1} under par."
end
