class Question < ApplicationRecord
  validates_presence_of :text, :answers
  belongs_to :section
  has_many :questionnaire_questions
  has_many :questionnaires, through: :questionnaire_questions
  has_many :taggings
  has_many :tags, through: :taggings

  def self.find_demographics(tags)
    select(:id, :text)
    .joins(:tags)
    .where('tags.id = any (array[?])', tags)
    .where(section_id: 1)
  end

  def self.find_clinicals(tags)
    select(:id, :text)
    .joins(:tags)
    .where('tags.id = any (array[?])', tags)
    .where(section_id: 2)
  end
end
