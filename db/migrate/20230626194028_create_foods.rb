class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
    add_reference :foods, :user, foreign_key: true
  end
end
