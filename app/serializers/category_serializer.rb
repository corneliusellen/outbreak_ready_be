class CategorySerializer < ActiveModel::Serializer
  attributes :name, :tags

  def tags
    object.tags.map do |tag|
      TagSerializer.new(tag)
    end
  end
end
