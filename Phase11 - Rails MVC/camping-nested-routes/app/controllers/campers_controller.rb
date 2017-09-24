class CampersController < ApplicationController

  def index

    if !params[:campsite_id].nil?
      @campsite = Campsite.find(params[:campsite_id])
      @campers = @campsite.campers.all
      @title = "Campers bunking in #{@campsite.name}"
    else
      @campers = Camper.all
      @title = "All Campers:"
    end
  end

  def show
    @camper = Camper.find(params[:id])
  end
end
