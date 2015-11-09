class User < ActiveRecord::Base
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_secure_password

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: VALID_EMAIL_REGEX


  after_initialize :set_default_values

  def set_default_values
    self.admin ||= 0
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
