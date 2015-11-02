class Category < ActiveRecord::Base
  #category: title(required)
  validates(:title, {presence: true})
end
