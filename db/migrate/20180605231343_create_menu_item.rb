class CreateMenuItem < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :dish
      t.string :ingredients
      t.references :questionnaire, foreign_key: true
    end
  end
end
