class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can [:update], User do |u|
        u == user
      end
      can [:read], [Member, Student, Post]
    end
    if user.member?
      can [:update, :destroy], Member do |member|
        member.user == user
      end
      can [:create], Post
      can [:update, :destroy], Post do |post|
        post.author == user.role
      end
    end
    if user.student?
      can [:update, :destroy], Student do |student|
        student.user == user
      end
      can [:create], Post
      can [:update, :destroy], Post do |post|
        post.author == user.role
      end
    end
  end
end
