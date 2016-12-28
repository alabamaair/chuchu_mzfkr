class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket =  current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    if current_user.admin?
      @ticket = Ticket.find params[:id]
    else
      @ticket = current_user.tickets.find params[:id]
    end
  end

  def ticket_params
    params.require(:ticket).permit(:fio, :passport, :start_station_id, :end_station_id, :train_id)
  end
end