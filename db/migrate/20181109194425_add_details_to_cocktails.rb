class AddDetailsToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :details, :text
  end
end
