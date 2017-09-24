class Airplane
  attr_reader :type, :wing_loading, :horsepower, :engine_running,
    :flying, :fuel

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_running = false
    @flying = false
    @fuel = 100
  end

  def start
    if @fuel < 10
      "there's not enough fuel!"
    elsif @engine_running == false
      @engine_running = true
      @fuel -= 10
      "airplane started"
    else
      "airplane already started"
    end
  end

  def takeoff
    if @engine_running == false
      "airplane not started, please start"
    elsif @flying == true
      "airplane is already flying"
    elsif @fuel < 20
      "there's not enough fuel!"
    else
      @flying = true
      @fuel -= 20
      "airplane launched"
    end
  end

  def land
    if @engine_running == false
      "airplane not started, please start"
    elsif @flying == false
      "airplane is already on the ground"
    else
      @fuel -= 50
      "airplane landed"
    end
  end
end
