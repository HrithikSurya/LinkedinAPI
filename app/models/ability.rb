# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.job_seeker?
      # can :manage, JobProfile, id = user.id # pending, job seeker can manage their own job profile
      can :read, JobProfile
      can :read, UserProfile
      can :manage, User, id: user.id
    elsif user.job_recruiter?
      # can :manage, JobProfile, user_id = user.id #job recruiter can manage their own job profile
      can :manage, JobProfile #manages those jobprofile they created by their own
      can :read, UserProfile 
      can :manage, User, id: user.id
    elsif user.admin? 
      can :manage, :all
    end
  end
end
