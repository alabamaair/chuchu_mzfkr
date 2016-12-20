class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :wagons, before_add: :add_number

  def counting_seats(type_wagon, type_seat)
    Wagon.where('type = ?', type_wagon).sum("#{type_seat}".to_sym)
  end

  private

  def add_number(wagon)
    wagon.number = wagons.maximum(:number).to_i + 1
  end

end
