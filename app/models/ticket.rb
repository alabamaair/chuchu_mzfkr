class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  before_create :number_generate
  after_create :send_notification_buy
  after_destroy :send_notification_cancel

  def number_generate
    self.number = "TN#{Time.now.year}#{Time.now.month}#{Time.now.day}#{Array.new(4){rand(9)}.join}"
  end

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification_buy
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_cancel
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end

end
