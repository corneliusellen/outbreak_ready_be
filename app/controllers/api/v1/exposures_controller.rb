class Api::V1::ExposuresController < ApplicationController
  before_action :identify_questionnaire_tags
  before_action  do
    filter_questions(3)
  end

  def index
    render json: @filtered
  end
end
