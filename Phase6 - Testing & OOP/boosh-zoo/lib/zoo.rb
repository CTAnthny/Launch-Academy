class Zoo
  attr_reader :employees, :cages, :season_opening_date, :season_closing_date

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @employees = []
    @cages = []
    10.times { @cages << Cage.new }
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    if date > season_opening_date && date < season_closing_date
      true
    else
      false
    end
  end

  def at_capacity?
    full = true
    @cages.each do |cage|
      if cage.empty?
        full = false
      end
    end
    full
  end

  def add_animal(name)
    if !self.at_capacity?
      first_empty_cage_index = @cages.find_index { |cage| cage.empty? }
      @cages[first_empty_cage_index].animal = name
    else
      raise ZooAtCapacity
    end
  end

  def visit
    visiting_string = ""

    @employees.each do |employee|
      visiting_string << employee.greet + "\n"
    end

    @cages.each do |cage|
      if !cage.empty?
        visiting_string << cage.animal.speak + "\n"
      end
    end

    visiting_string
  end
end

class ZooAtCapacity < Exception
end
