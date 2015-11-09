class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  default_scope { order(:created_at) }
  scope :admin, -> { where(admin: true) }

  def name
    "#{first_name} #{last_name}"
  end
end
