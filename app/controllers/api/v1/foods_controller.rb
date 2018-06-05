class Api::V1::FoodsController < ApplicationController

  def create
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    foods = JSON.parse(request.env['HTTP_FOODS'])
    foods.each do |food|
      MenuItem.create(dish: food[0], ingredients: food[1], questionnaire_id: questionnaire.id)
    end
  end

  def index
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    menu_items = MenuItem.where(questionnaire_id: questionnaire.id)
    render json: menu_items
  end
end
