class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail }
  # validates_uniqueness_of :ingredient_id, scope: [:cocktail_id]
end
