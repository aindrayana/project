class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, dependent: :nullify

  has_many :comments, dependent: :nullify
  has_many :posts_comments, through: :posts, source: :comments


  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  after_initialize :set_default_values

  private

  def set_default_values
    self.admin ||= false
  end

end
