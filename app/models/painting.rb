class Painting < ActiveRecord::Base
  mount_uploader :image, PaintingUploader

  validates_presence_of :rank, :image, :name

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }
  scope :for_homepage, -> { where(show_on_homepage: true) }

  belongs_to :group

  before_save :set_homepage, if: :show_on_homepage_changed?
  before_destroy :require_homepage, if: :show_on_homepage

  private
  def set_homepage
    return false unless show_on_homepage

    Painting.where.not(id: id)
      .where(show_on_homepage: true)
      .update_all(show_on_homepage: false)
  end

  def require_homepage
    return false
  end
end
