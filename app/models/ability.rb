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
      can [:create, :read], [Member, Student]
      can [:update, :destroy], Member do |member|
        member.user == user
      end
      can [:update, :destroy], Student do |student|
        student.user == user
      end
    end
  end
end
