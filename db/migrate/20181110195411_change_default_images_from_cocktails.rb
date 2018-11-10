class ChangeDefaultImagesFromCocktails < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cocktails, :image_url, " "
  end
end
