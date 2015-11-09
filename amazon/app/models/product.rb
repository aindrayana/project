class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, {presence: true,
                    uniqueness: {message: "was already used"}}
  validates :price, presence: true
end
