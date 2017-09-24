require 'time'

MOVIES = [
  { name: "The Princess Bride", genre: "Comedy", start_time: "19:00" },
  { name: "Troll 2", genre: "Horror", start_time: "19:30" },
  { name: "Pet Cemetery", genre: "Horror", start_time: "20:15" },
  { name: "Flight of the Navigator", genre: "Adventure", start_time: "20:17" },
  { name: "Teen Witch", genre: "Comedy", start_time: "20:20" },
  { name: "The Goonies", genre: "Comedy", start_time: "20:30" },
  { name: "Better Off Dead", genre: "Comedy", start_time: "20:45" },
  { name: "Weekend at Bernies", genre: "Comedy", start_time: "21:00" },
  { name: "The Wizard", genre: "Adventure", start_time: "21:10" }
]

class Movie
  attr_reader :name, :genre, :start_time

  def initialize(row_hash)
    @name = row_hash[:name]
    @genre = row_hash[:genre]
    @start_time = Time.parse(row_hash[:start_time])
  end

  def showing_after?(arrival_time)
    Time.parse(arrival_time) <= @start_time
  end

  def showing_between?(early_time, late_time)
    @start_time >= Time.parse(early_time) && @start_time <= Time.parse(late_time)
  end

end

# MOVIES[row_hash]
movies = []
MOVIES.each do |movie|
  movies << Movie.new(movie)
end

puts movies[0].showing_after?("19:00")
puts movies[-1].showing_between?("20:00", "22:00")
