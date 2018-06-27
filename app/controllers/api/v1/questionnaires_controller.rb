class Api::V1::QuestionnairesController < ApplicationController

  def index
    questionnaires = @current_user.questionnaires
    render json: questionnaires
  end

  def create
    title = request.headers['Title']
    questionnaire = Questionnaire.new(title: title, user_id: @current_user.id)
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

  def destroy
    questionnaire = Questionnaire.find(params[:id])
    questionnaire.intakes.destroy_all
    questionnaire.questions.destroy_all
    questionnaire.destroy
    render status: 201
  end
end
