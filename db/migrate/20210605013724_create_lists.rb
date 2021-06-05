class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string:tile
      t.string:body

      t.timestamps
    end
  end
end
