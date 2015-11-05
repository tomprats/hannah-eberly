class Group < ActiveRecord::Base
  validates_presence_of :rank, :active, :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  belongs_to :primary_painting, class_name: Painting
end
