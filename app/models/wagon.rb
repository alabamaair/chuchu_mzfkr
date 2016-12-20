class Wagon < ApplicationRecord
  belongs_to :train

  scope :tail, -> { order('number DESC')}
  scope :head, -> { order('number ASC')}

  validates :number, uniqueness: { scope: :train }
end
