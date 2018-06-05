class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :foods

  def foods
    object.foods.flatten
  end
end
