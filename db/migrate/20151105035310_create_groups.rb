class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :primary_painting_id,    null: false
      t.boolean :active, default: false, null: false
      t.integer :rank,   default: 100,   null: false
      t.string :name,                    null: false
      t.string :description

      t.timestamps                       null: false
    end
  end
end
