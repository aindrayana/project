class Contact < ActiveRecord::Base
  validates(:name, {presence: true,
                    uniqueness: true})

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: VALID_EMAIL_REGEX

  after_initialize :set_default_values

  # def self.words_limit(limit)
  #   string_arr = self.split(' ')
  #   string_arr.count > limit ? "#{string_arr[0..(limit-1)].join(' ')}..." : self
  # end

  private

  def set_default_values
    # set the value to 5 if the value is nill
    self.status ||= 0
  end


end
