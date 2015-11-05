class Painting < ActiveRecord::Base
  validates_presence_of :group_id, :active, :rank, :image, :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  belongs_to :group
end
