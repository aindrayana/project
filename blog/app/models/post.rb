class Post < ActiveRecord::Base
  # post: title(required & unique), body
  validates(:title, {presence: true,
                    uniqueness: true})
end
