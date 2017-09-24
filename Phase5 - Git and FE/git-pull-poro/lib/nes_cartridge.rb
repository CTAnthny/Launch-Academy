class NesCartridge
  attr_reader :title, :developer, :year
  
  def initialize(title, developer, year)
    @title = title
    @developer = developer
    @year = year
  end
end
