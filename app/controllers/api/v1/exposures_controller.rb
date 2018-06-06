class Api::V1::ExposuresController < ApplicationController

  def index
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    @tags = questionnaire.tags.map {|tag| tag.id}
    # tags.push(25)
    questions = Question.find_exposures
    filtered = questions.find_all do |question|
      check_included(question.all_tags)
    end
    render json: filtered
  end

  def check_included(all_tags)
    all_tags.all? do |tag|
      @tags.include?(tag)
    end
  end
end
