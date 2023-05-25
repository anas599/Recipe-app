class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measure_unit, presence: true, inclusion: { in: %w[gram(s) pound(s) unit(s)] }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
