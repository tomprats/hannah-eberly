class CreateApps < ActiveRecord::Migration
  def up
    create_table :apps do |t|
      t.string :share_title
      t.string :share_description
      t.string :share_image
      t.string :homepage_image
      t.string :bio_image
      t.string :contact_email
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :google_analytics_code
    end

    App.default.update(
      remote_share_image_url: "https://hannah-eberly.s3.amazonaws.com/paintings/6/original.JPG",
      remote_homepage_image_url: "https://hannah-eberly.s3.amazonaws.com/paintings/15/original.JPG",
      remote_bio_image_url: "https://hannah-eberly.s3.amazonaws.com/paintings/6/original.JPG"
    )

    remove_column :paintings, :show_on_homepage, :boolean, default: false, index: true
  end

  def down
    add_column :paintings, :show_on_homepage, :boolean, default: false, index: true
    drop_table :apps
  end
end
