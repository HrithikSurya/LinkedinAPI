# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.job_seeker?
      can :read, JobProfile
      can :manage, UserProfile, user_id: user.id
    elsif user.job_recruiter?
      # debugger
      can :manage, JobProfile
      can :read, UserProfile
    elsif user.admin? 
      can :manage,:all
    end
  end
end
