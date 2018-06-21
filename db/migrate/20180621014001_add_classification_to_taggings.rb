class AddClassificationToTaggings < ActiveRecord::Migration[5.1]
  def change
    add_column :taggings, :classification, :integer
  end
end
