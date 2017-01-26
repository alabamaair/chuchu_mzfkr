class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :add_railway_station]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route], notice: 'Маршут создан успешно.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to admin_routes_path, notice: 'Маршут обновлен успешно.'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_url, notice: 'Маршут удален успешно.'
  end

  def add_railway_station
    station = RailwayStation.find params[:railway_station][:railway_station_id]
    @route.railway_stations << station
    if @route.save
      redirect_to [:admin, @route], notice: 'Станция добавлена успешно.'
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:name)
    end
end
