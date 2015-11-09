class User < ActiveRecord::Base
  has_secure_password
  has_many :products, dependent: :nullify
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
