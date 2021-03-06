class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all.order(name: :desc)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:success] = 'Manufacturer added successfully!'
      redirect_to @manufacturer
    else
      render 'new'
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
