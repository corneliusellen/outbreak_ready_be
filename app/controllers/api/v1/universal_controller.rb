class Api::V1::UniversalController < ApplicationController
  skip_before_action :authenticate_request

  def index
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    ids_array = questionnaire.question_ids
    universals = Question.universal_not_included(ids_array)
    render json: universals
  end
end
