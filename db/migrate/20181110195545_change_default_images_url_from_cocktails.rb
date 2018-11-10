class ChangeDefaultImagesUrlFromCocktails < ActiveRecord::Migration[5.2]
  def change
    change_column :cocktails, :image_url, :text
  end
end
