class Api::V1::DemographicsController < ApplicationController

  def index
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    tags = questionnaire.tags.map {|tag| tag.id}
    tags.push(25)
    render json: Question.find_demographics(tags)
  end
end
