class Track
  attr_writer :album_id, :track_id, :title, :track_number, :duration_ms

  def initialize(album_id, track_id, title, track_number, duration_ms)
    @album_id, @track_id, @title, @track_number, @duration_ms = album_id, track_id, title, track_number, duration_ms
  end
end
