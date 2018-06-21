class Question < ApplicationRecord
  validates_presence_of :text, :answers
  belongs_to :section
  has_many :questionnaire_questions
  has_many :questionnaires, through: :questionnaire_questions
  has_many :taggings
  has_many :tags, through: :taggings

  def self.find_questions_with(section_id)
    select('questions.id, questions.text,
            JSON_AGG(tags.id) as all_tags, JSON_AGG(taggings.classification) as all_classifications')
    .joins(:tags)
    .where("section_id = ?", section_id)
    .group('questions.id')
  end
end
