class Comment < ActiveRecord::Base
  #comment: body (required & unique per blog post)
  validates(:body, {presence: true})
end
