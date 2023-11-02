# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.job_seeker?
      can :read, JobProfile
      
      can :manage, User, id: user.id #workin
      can :read, User #workin
      
      can :manage, UserProfile, user_id: user.id #workin
      can :read, UserProfile #workin

      can :read, Company #workin

    elsif user.job_recruiter?
      can :manage, JobProfile #manages those jobprofile they created by their own functionality
      
      can :manage, User, id: user.id #workin, tested
      can :read, User #workin, tested
      
      can :manage, UserProfile, user_id: user.id
      can :read, UserProfile

      can :manage, Company

    elsif user.admin? 
      can :manage, :all
    end
  end
end
