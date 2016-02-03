class AddHomePageImage < ActiveRecord::Migration
  def change
    add_column :paintings, :show_on_homepage, :boolean, default: false, index: true
    change_column :paintings, :group_id, :integer, null: true
  end
end
