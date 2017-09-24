require 'pry'

class Playlist
  attr_accessor :playlist

  ACCEPTED_SONGS = [
    "Hello - Lionel Ritchie",
    "Kokomo - The Beach Boys",
    "Girl You Know It's True - Milli Vanilli",
    "Agadoo - Black Lace",
    "Down Under - Men at Work",
    "Nothing's Gonna Stop Us Now - Starship",
    "Get Outta My Dreams, Get Into My Car - Billy Ocean",
    "I Just Called To Say I Love You - Stevie Wonder",
    "Hangin' Tough - New Kids on the Block",
    "We Built This City - Starship",
    "Wake Me Up Before You Go Go - Wham!",
    "We Didn't Start The Fire - Billy Joel",
    "I Wanna Dance With Somebody - Whitney Houston",
    "U Can't Touch This - MC Hammer"
  ]

  def initialize(user_list)
    @playlist = []
    user_list.each do |song|
      if ACCEPTED_SONGS.include?(song)
        @playlist << song
      end
    end
  end

  def shuffle!
    @playlist.shuffle!
  end

  def play!
    @playlist.delete_at(0)
  end

  def add_track(track)
    if ACCEPTED_SONGS.include?(track)
      @playlist << track
      return true
    else
      return false
    end
  end

  def output
    @playlist.join("\n")
  end
end

my_playlist = Playlist.new(Playlist::ACCEPTED_SONGS)
puts my_playlist.output

binding.pry
