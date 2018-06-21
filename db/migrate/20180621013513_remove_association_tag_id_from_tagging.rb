class RemoveAssociationTagIdFromTagging < ActiveRecord::Migration[5.1]
  def change
    remove_column :taggings, :association_tag_id
    remove_column :taggings, :association_tag_id_2
  end
end
