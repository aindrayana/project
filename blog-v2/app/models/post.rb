class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy
  # has_many :votes, dependent: :destroy
  # has_many :voting_users, through: :votes, source: :user

  # ----------------------------------------------------------------------------

  after_initialize :set_default_values
  before_validation :capitalize_title

  # ----------------------------------------------------------------------------

  validates :title, presence: true,
                    uniqueness: {message: "was already used"},
                    length:    {minimum: 3}
  validates :body, presence: true,
                  uniqueness: {scope: :title}

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  # ----------------------------------------------------------------------------

  # def voted_on_by?(user)
  #   vote_for(user).present?
  # end
  #
  # def vote_for(user)
  #   votes.find_by_user_id user.id
  # end
  #
  # def vote_result
  #   # this will show the number of votes
  #   votes.select {|v| v.is_up?}.count - votes.select {|v| !v.is_up?}.count
  # end

  private

    def set_default_values
      self.view_count ||= 0
    end

    def capitalize_title
      self.title.capitalize! if title
    end

end
