class TagSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :id, :name, :category_id, :options

  def id
    object.id
  end

  def name
    object.name
  end

  def category_id
    object.category_id
  end

  def options
    object.options
  end
end
