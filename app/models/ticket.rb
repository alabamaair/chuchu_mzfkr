class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  before_create :number_generate

  def number_generate
    self.number = "TN#{Time.now.year}#{Time.now.month}#{Time.now.day}#{Array.new(4){rand(9)}.join}"
  end
end
