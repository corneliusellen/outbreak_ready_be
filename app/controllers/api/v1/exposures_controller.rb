class Api::V1::ExposuresController < ApplicationController
  before_action :identify_questionnaire_tags
  before_action { filter_questions(3) }

  def index
    render json: @filtered
  end
end
