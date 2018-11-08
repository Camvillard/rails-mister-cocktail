class AddDetailsToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :details, :text
  end
end
