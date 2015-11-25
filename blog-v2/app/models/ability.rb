class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Post do |post|
      user == post.user
    end

    can :manage, Comment do |a|
      user == a.user
    end

    can :destroy, Comment do |a|
      user == a.post.user
    end
  end

end
