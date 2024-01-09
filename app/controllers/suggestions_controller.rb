class SuggestionsController < ApplicationController
  load_and_authorize_resource

  def index
    # show the suggestions
    @suggestions = Suggestion.all
    # @suggestions = JobProfile.preload(:user_profiles).references(:user_profiles) #not working
    render json: @suggestions, status: 200
    # render json: SuggestionSerializer.new(@suggestions).serializable_hash[:data][:attributes]
  end

  def user
    user = current_user
    if user
      u_skills = user.user_profile.skill_set.split(",") #picking up the user skills
      suggestions = Array.new
      
      profiles = JobProfile.all
      c = 0
      
      profiles.each do |profile|
        jp_skills = profile.skills_required.split(",") #picking up the jobprofile skills

        u_skills.each do |user_skill| #skills of current user
          jp_skills.each do |profile_skill|       
            if user_skill.strip == profile_skill.strip
              c = c+1 #frequency counting
            end
          end
        end
        if c>=3 #hardcoding
          suggestions.push(profile)
        end
        c=0
      end
      render json: suggestions, status:200
    else
      render json: "user not found", status: 404    
    end
  end

  def suggestions_for_co
    u_skills = user.user_profile.skill_set.split(",") #picking up the user skills
    suggestions = Array.new
    
    profiles = JobProfile.all
    c = 0
    
    profiles.each do |profile|
      jp_skills = profile.skills_required.split(",") #picking up the jobprofile skills
  
      u_skills.each do |user_skill| #skills of current user
        jp_skills.each do |profile_skill|       
          if user_skill.strip == profile_skill.strip
            c = c+1 #frequency counting
          end
        end
      end
      if c>=3 #hardcoding
        suggestions.push(profile)
      end
      c=0
    end
    render json: suggestions, status:200
  end

  private
  def calculate_suggestions
  end
end
