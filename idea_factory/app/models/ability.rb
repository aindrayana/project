class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Idea do |q|
      user == q.user
    end

    can :manage, Comment do |a|
      user == a.user
    end

    can :destroy, Comment do |a|
      user == a.idea.user
    end
  end

end
