class Group < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope { order(:created_at) }

  belongs_to :primary_painting, class_name: Painting
  has_many :paintings
end
