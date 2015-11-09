class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  # post: title(required & unique), body
  validates(:title, {presence: true,
                    uniqueness: true})
end
