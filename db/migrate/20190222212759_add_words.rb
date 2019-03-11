class AddWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :points
      t.references :game
    end
  end
end
