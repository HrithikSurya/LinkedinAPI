# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.job_seeker?
      can :read, JobProfile
      
      can :manage, User, id: user.id
      can :read, User

      can :manage, UserProfile, user_id: user.id
      can :read, UserProfile

      can :read, Company

      can :applied_job_application, JobApplication

    elsif user.job_recruiter?
      can :read, Company #read our as well as other companies  
      can :create, Company #create our company
      can :manage, Company, user_id: user.id #check

      can :manage, User, id: user.id #can manage our own user
      can :read, User #read other users as well
      
      can :manage, UserProfile, user_id: user.id #can manage our own userprofile 
      can :read, UserProfile #read other userprofiles as well


      can :read, JobProfile #read our as well as other job profiles
      can :create, JobProfile #create job profiles for our company
      can :manage, JobProfile, company_id: user.company.id if user.company&.id.present?
      #update, deletion working on our own created company
      #can manages those jobprofile that are associated with the current_user's company

      can [:index, :show, :reject_job_application,
        :accept_job_application,
        :view_approved_job_application,
        :view_rejected_job_application], JobApplication
    end
  end
end
