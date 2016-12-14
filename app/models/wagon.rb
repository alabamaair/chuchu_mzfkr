class Wagon < ApplicationRecord
  belongs_to :train

  scope :kupe, -> { where('type_w =? ', 'купе') }
  scope :platscart, -> { where('type_w =? ', 'плацкарт') }
end
