class Painting < ActiveRecord::Base
  mount_uploader :image, PaintingUploader

  validates_presence_of :active, :rank, :image, :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  belongs_to :group
end
