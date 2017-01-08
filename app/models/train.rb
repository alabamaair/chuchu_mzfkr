class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :wagons, before_add: :add_number

  validates :number, presence: true

  def counting_seats(type_wagon, type_seat)
    wagons.where('type = ?', type_wagon).sum("#{type_seat}".to_sym)
  end

  def current_order_wagons
    order_wagons ? wagons.head : wagons.tail
  end

  private

  def add_number(wagon)
    wagon.number = wagons.maximum(:number).to_i + 1
  end

end
