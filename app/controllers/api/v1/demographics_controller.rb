class Api::V1::DemographicsController < ApplicationController
  before_action :identify_questionnaire_tags
  before_action  do
    filter_questions(1)
  end

  def index
    render json: @filtered
  end
end
