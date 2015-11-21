class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.integer :group_id,               null: false, index: true
      t.boolean :active, default: false, null: false
      t.integer :rank,   default: 100,   null: false, index: true
      t.string :image,                   null: false
      t.string :name,                    null: false
      t.string :description

      t.timestamps                       null: false
    end

    add_index :paintings, [:active, :rank]
  end
end
