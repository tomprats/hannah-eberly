class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :group_id
      t.boolean :active, default: false, null: false
      t.integer :rank,   default: 100,   null: false, index: true
      t.string :path,                    null: false, index: true
      t.string :name,                    null: false
      t.text :text

      t.timestamps                       null: false
    end

    add_index :pages, [:active, :rank]

    # To be removed
    change_column :paintings, :group_id, :integer, null: false
    change_column :groups, :primary_painting_id, :integer, null: true
    remove_column :groups, :rank
    remove_column :groups, :active
    remove_column :groups, :description
  end
end
