class Api::V1::QuestionnairesController < ApplicationController

  def create
    Questionnaire.create!(title: "Test 2")
  end
end
