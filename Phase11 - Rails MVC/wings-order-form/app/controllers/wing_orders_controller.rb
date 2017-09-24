class WingOrdersController < ApplicationController
  before_action :set_wing_order, only: [:show, :edit, :update, :destroy]

  def index
    @wing_orders = WingOrder.all
  end

  def show
  end

  def new
    @wing_order = WingOrder.new
    @state_collection = WingOrder::STATES
    @quantity_collection = WingOrder::QUANTITIES
    @flavor_collection = Flavor.all
  end

  def create
    @wing_order = WingOrder.new(wing_order_params)
    @wing_order.flavors = Flavor.where(id: params[:wing_order][:flavor_ids])
    if @wing_order.save
      flash[:notice] = "Wing order created!"
      redirect_to wing_orders_path
    else
      flash[:alert] = "Wing order not created"
      @state_collection = WingOrder::STATES
      @quantity_collection = WingOrder::QUANTITIES
      @flavor_collection = Flavor.all
      render :new
    end
  end

  def edit
    @wing_order = WingOrder.new
    @state_collection = WingOrder::STATES
    @quantity_collection = WingOrder::QUANTITIES
    @flavor_collection = Flavor.all
  end

  def update
    respond_to do |format|
      if @wing_order.update(wing_order_params)
        format.html { redirect_to @wing_order, notice: 'Your wings order was successfully updated.' }
        format.json { render :show, status: :ok, location: @wing_order }
      else
        format.html { render :edit }
        format.json { render json: @wing_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wing_order.destroy
    respond_to do |format|
      format.html { redirect_to wing_orders_url, notice: 'Your wings order was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_wing_order
    @wing_order = WingOrder.find(params[:id])
  end

  def wing_order_params
    params.require(:wing_order).permit(
      :customer_name,
      :city,
      :state,
      :quantity,
      :ranch_dressing
    )
  end
end
