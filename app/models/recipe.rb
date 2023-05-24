class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true, numericality: { only_integer: true }
  validates :prep_time, presence: true, numericality: { only_integer: true }
end
