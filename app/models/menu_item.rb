class MenuItem < ApplicationRecord
  validates_presence_of :dish, :ingredients
  belongs_to :questionnaire
end
