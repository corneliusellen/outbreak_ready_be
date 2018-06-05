class Api::V1::ClinicalsController < ApplicationController

  def index
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    tags = questionnaire.tags.map {|tag| tag.id}
    tags.push(25)
    render json: Question.find_clinicals(tags)
  end
end
