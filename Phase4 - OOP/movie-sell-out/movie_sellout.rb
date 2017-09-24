class Theater
  attr_reader :admitted_patrons, :available_seats

  def initialize(admitted_patrons = 0, available_seats = 70)
    @admitted_patrons = admitted_patrons
    @available_seats = available_seats
  end

  def admit!(patron_quantity = 1)
    if @admitted_patrons != @available_seats
      @admitted_patrons += patron_quantity
    else
      "Sorry, we're full!"
    end
  end

  def at_capacity?
    @admitted_patrons == @available_seats
  end

  def record_walkouts!(exiting_patron = 1)
    @admitted_patrons -= exiting_patron
  end
end
