class PersonalizedHavocError < StandardError
end

module PartyGoer
  def initialize
    @drink_count = 0
  end

  def drink
    @drink_count += 1
    if @drink_count < 4
      true
    else
      false
    end
  end

  def sing
    "We move like cagey tigers\n" +
    "We couldn't get closer than this\n" +
    "The way we walk\n" +
    "The way we talk\n" +
    "The way we stalk\n" +
    "The way we kiss\n" +
    "We slip through the streets\n" +
    "While everyone sleeps\n" +
    "Getting bigger and sleeker\n" +
    "And wider and brighter\n" +
    "We bite and scratch and scream all night\n" +
    "Let's go and throw\n" +
    "All the songs we know"
  end

  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end
end

module Invited
  def invited?
    true
  end
end
