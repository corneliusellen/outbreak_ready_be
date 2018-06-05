class Api::V1::QuestionnairesController < ApplicationController

  def create
    Questionnaire.create!(title: "Test 2")
  end

  def update
    questionnaire = Questionnaire.find(params[:id])
    JSON.parse(request.env['HTTP_QUESTIONS']).each do |question_id|
      QuestionnaireQuestion.create(questionnaire_id: questionnaire.id, question_id: question_id.to_i)
    end
  end
end
