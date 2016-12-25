class TicketsController < ApplicationController
  def new
    @user = User.new
    @ticket = Ticket.new
  end

  def create
    @user = User.create(name: params[:user_name])
    @ticket = @user.tickets.new(ticket_params)
    @ticket.number = "TN#{Time.now.year}#{Time.now.month}#{Time.now.day}#{Array.new(4){rand(9)}.join}"

    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  def show
    @ticket = Ticket.find params[:id]
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_name, :fio, :passport, :start_station_id, :end_station_id, :train_id)
  end
end