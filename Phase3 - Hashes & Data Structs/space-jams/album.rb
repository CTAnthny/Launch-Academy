# object state: Album.new(track[:album_id], track[:album_name], track[:artists])
# CSV format: album_id,track_id,title,track_number,duration_ms,album_name,artists

class Album
  attr_accessor :album_id, :album_title, :album_artists, :tracks, :tracks_duration, :duration_min

  def initialize(album_id = nil, album_title = nil, album_artists = nil, tracks = [], tracks_duration = [], duration_min = 0)
    @album_id, @album_title, @album_artists, @tracks, @tracks_duration, @duration_min = album_id, album_title, album_artists, tracks, tracks_duration, duration_min
  end

  # returns the ID of the album
  def id
    @album_id
  end

  # returns the title of the album
  def title
    @album_title
  end

  #returns the name of the artist(s) on the album
  def artists
    @album_artists
  end

  # returns an array of hashes representing each track on the album
  def tracks
    @tracks
  end

  def tracks_duration
    @tracks_duration
  end

  # returns the duration of the album in minutes (duration_ms in the CSV is duration in milliseconds)
  def duration_min
    album_duration = 0
    @tracks_duration.each do |track|
      album_duration += track.to_i
    end
    @duration_min = ((album_duration / 1000).to_f / 60).to_f.round(2)
  end

  # returns a string of summary information about the album
  def summary
    summary = "\n"
    summary << "Name: #{@album_title}\n"
    summary << "Artist(s): #{album_artists}\n"
    summary << "Duration (min.): #{duration_min}\n"
    summary << "Tracks: \n"
    @tracks.each { |track| summary << "- #{track.instance_variable_get("@title")}\n" }
    summary
  end
end
