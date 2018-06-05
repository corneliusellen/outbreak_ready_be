class Api::V1::IntakesController < ApplicationController

  def create
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    tags = JSON.parse(request.env['HTTP_TAGS'])
    tags.each do |tag|
      Intake.create!(questionnaire_id: questionnaire.id, tag_id: tag.to_i)
    end
  end
end
