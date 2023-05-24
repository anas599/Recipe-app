class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measure_unit, presence: true, inclusion: { in: %w[Gram Pound Unit] }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
