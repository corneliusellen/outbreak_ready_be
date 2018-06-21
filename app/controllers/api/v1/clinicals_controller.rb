class Api::V1::ClinicalsController < ApplicationController
  before_action :identify_questionnaire_tags
  before_action  do
    filter_questions(2)
  end

  def index
    render json: @filtered
  end
end
