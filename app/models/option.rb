class Option < ApplicationRecord
  validates_presence_of :name
  belongs_to :tag
end
