class AddDirectionsToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :directions, :text
  end
end
