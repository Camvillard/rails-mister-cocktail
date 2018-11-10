class AddImageToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :image, :string, default: "https://picsum.photos/800/1200"
  end
end
