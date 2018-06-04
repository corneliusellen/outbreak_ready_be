class CreateOption < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.references :tag, foreign_key: true
    end
  end
end
