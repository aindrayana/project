class Product < ActiveRecord::Base
  validates :title, {presence: true,
                    uniqueness: {message: "was already used"}}
  validates :price, presence: true
end
