require 'csv'

class TelevisionShow
  GENRES = ["Action", "Mystery", "Drama", "Comedy", "Fantasy"]
  attr_reader :title, :network, :year, :genre, :synopsis

  def initialize(title, network, year, genre, synopsis)
    @title = title
    @network = network
    @year = year
    @genre = genre
    @synopsis = synopsis
    @errors = []
  end

  def errors
    @errors
  end

  def valid?
    valid = true
    attributes = []
    attributes << @title << @network << @year << @genre << @synopsis
    attributes.each do |attribute|
      if attribute == ""
        valid = false
        @errors << "Please fill in all require fields."
      elsif check_duplicate_title?
        valid = false
        @errors << "The show has already been added."
      end
    end
    valid
  end

  def check_duplicate_title?
    title_array = []
    CSV.foreach('television-shows.csv') do |row|
      title_array.push(row[0])
    end
    title_array.any? { |title| title == @title }
  end

  def save?
    if self.valid?
      CSV.open('television-shows.csv', 'a') do |csv|
        csv << @title << @network << @year << @synopsis << @genre
      end
      true
    else
      false
    end
  end

# it "should return an array of TV objects for each row in the csv"
  def self.all
    CSV.foreach('television-shows.csv', headers: true) do |row|
      
    end
  end
end
