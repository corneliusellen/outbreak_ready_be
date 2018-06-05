class QuestionsAnswersSerializer < ActiveModel::Serializer
  attributes :id, :text, :answers, :section_id
end
