class RemoveDetailsFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :details, :text
  end
end
