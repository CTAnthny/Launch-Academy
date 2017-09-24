class SuppliesController < ApplicationController
  def index
    if !params[:camper_id].nil?
      @camper = Camper.find(params[:camper_id])
      @supplies = @camper.supplies
      # @supplies = Supply.select('name').where("camper_id = ?", params[:camper_id])
      @title = "Supplies Brought by #{@camper.name}"
    else
      @supplies = Supply.all
      @title = "All Supplies:"
    end
  end
end
