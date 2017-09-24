class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero
  def backstory
    "He somehow seems to be permeated with electricity."
  end

  def powers
    "Can run 1000 times as fast as a normal Superhero."
  end

  def weakness
    "Water, extreme cold."
  end

  def speed_in_mph
    60000
  end
end

class Brawler < SuperHero
  def backstory
    "Orphaned, but born and raised on the streets, did he inherit his superpowers from a special donor?"
  end

  def powers
    "20 times as healthy as a normal SuperHero, plus he can punch really hard."
  end

  def weakness
    "Complex logic."
  end

  def health
    2000
  end
end

class Detective < SuperHero
  def backstory
    "Unknown. He hates crime but loves a mystery."
  end

  def powers
    "He knows everyone's true identity."
  end

  def weakness
    "Luke Bayne"
  end

  def speed_in_mph
    10
  end
end

class Demigod < SuperHero
  def backstory
    "Unknown."
  end

  def powers
    "Flight, telepathic persuasion, temporal incorporeality."
  end

  def weakness
    "Extreme heat and cold."
  end

  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades < SuperHero
  def backstory
    "She's good at everything, so she isn't human and she's from Venus."
  end

  def powers
    "Psychic and very skillful."
  end

  def weakness
    "Specialization."
  end

  def species
    "Alien"
  end

  def home
    "Venus"
  end

  def psychic?
    true
  end
end

class WaterBased < SuperHero
  def backstory
    "A radical hydrologist who was experimenting with human adaptation to water supply, self-testing " +
    "resulted in his own aquatic evolution."
  end

  def powers
    "Psychic and can manipulate water."
  end

  def weakness
    "Dehydration"
  end

  def home
    "Earth's Oceans"
  end

  def fans_per_thousand
    5
  end

  def psychic?
    true
  end
end
