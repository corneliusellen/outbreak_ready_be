class Menu
  include ActiveModel::Serialization
  attr_reader :id, :name, :data, :foods

  def initialize(info)
    @id = info["menuId"]
    @name = info["name"]
    @data = info["entries"]["items"]
    @foods = []
  end
end
