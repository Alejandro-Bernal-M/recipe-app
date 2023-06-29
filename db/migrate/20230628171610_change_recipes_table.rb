class ChangeRecipesTable < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :cooking_time, :float
    change_column :recipes, :preparation_time, :float
  end
end
