class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient, message: "One dose for one cocktail/ingredient pair" }
end
