class Api::V1::DemographicsController < ApplicationController
  before_action :identify_questionnaire_tags
  before_action { filter_questions(1) }

  def index
    render json: @filtered
  end
end
