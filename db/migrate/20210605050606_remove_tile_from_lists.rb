class RemoveTileFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :tile, :string
  end
end
