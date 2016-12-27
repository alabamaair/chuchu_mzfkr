class WagonsController < ApplicationController
  before_action :set_train, only: [:new, :create]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.where(type: params[:type])
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to @train, notice: 'wagon was successfully created.'
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to [@train, @wagon], notice: 'wagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'wagon was successfully destroyed.'
  end

  private

  # def wagon_types
  #   [CoupeWagon, EconomyWagon, LuxWagon, SittingWagon]
  # end
  #
  # def wagon_type
  #   params[:type].constantize if params[:type].in? wagon_types
  # end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(params[:type].try(:underscore) || :wagon).permit(:type, :number, :bottom_seats, :top_seats, :side_top_seats, :side_bottom_seats, :sitting_seats)
  end
end
