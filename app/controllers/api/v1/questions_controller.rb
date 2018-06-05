class Api::V1::QuestionsController < ApplicationController

  def index
    questions = Questionnaire.find(params[:questionnaire_id]).find_questions
    render json: questions, each_serializer: QuestionsAnswersSerializer
  end
end
