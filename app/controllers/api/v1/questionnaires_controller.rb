class Api::V1::QuestionnairesController < ApplicationController

  def index
    questionnaires = @current_user.questionnaires
    render json: questionnaires
  end

  def create
    questionnaire = Questionnaire.new(title: "Test", user_id: @current_user.id)
    if questionnaire.save
      render json: {questionnaire_id: questionnaire.id}
    else
      render json: {error: 'questionnaire could not be created'}, status: 401
    end
  end

  def update
    questionnaire = Questionnaire.find(params[:id])
    JSON.parse(request.env['HTTP_QUESTIONS']).each do |question_id|
      QuestionnaireQuestion.create(questionnaire_id: questionnaire.id, question_id: question_id.to_i)
    end
  end
end
