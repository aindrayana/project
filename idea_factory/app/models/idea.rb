class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :joins, dependent: :destroy
  has_many :joins_users, through: :joins, source: :user

  # ----------------------------------------------------------------------------

  after_initialize :set_default_values
  before_validation :capitalize_title

  validates :title, presence: true,
                    uniqueness: {message: "was already used"},
                    length:    {minimum: 3}
  validates :body, presence: true,
                  uniqueness: {scope: :title}

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  # ----------------------------------------------------------------------------

  def liked_by?(user)
    like_for(user).present?
  end

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def joined_by?(user)
    join_for(user).present?
  end

  def join_for(user)
    joins.find_by_user_id(user.id)
  end


  private

    def set_default_values
      self.view_count ||= 0
    end

    def capitalize_title
      self.title.capitalize! if title
    end

end
