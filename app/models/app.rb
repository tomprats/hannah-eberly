class App < ActiveRecord::Base
  mount_uploader :share_image, ImageUploader
  mount_uploader :homepage_image, ImageUploader
  mount_uploader :bio_image, ImageUploader

  validate :only_one

  def self.default
    @app ||= App.first
    @app ||= App.create(
      share_title: "Hannah Eberly",
      share_description: "Original Artwork by Hannah Eberly",
      contact_email: "HEKEberly@gmail.com",
      instagram: "HEKEberlyPortraits",
      google_analytics_code: "UA-53529962-6"
    )
  end

  private
  def only_one
    one = id ? App.count == 1 : App.count.zero?
    errors.add(:id, "already exists") unless one
  end
end
