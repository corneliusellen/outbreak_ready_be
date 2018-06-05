class Api::V1::Search::MenusController < ApplicationController

  def index
    menus = MenuService.new(request.env['HTTP_VENUE_ID']).run
    render json: menus, each_serializer: MenuSerializer
  end
end
