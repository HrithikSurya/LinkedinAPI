class SuggestionsController < ApplicationController
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
      
      profiles = JobProfile.all
      
      skillh = Hash.new
      suggestions = Array.new
      c = 0
      
      profiles.each do |profile|
        skillh[:id] = profile.id        
        skillh[:skills] = profile.skills_required.split(",") #picking up the jobprofile skills

        u_skills.each do |user_skill| #skills of current user
          skillh[:skills].each do |profile_skill|       
            if user_skill.strip == profile_skill.strip
              c = c+1
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
    # create_table "suggestions", force: :cascade do |t|
    #   t.string "candidate"
    #   t.string "company"
    #   t.string "skills_matching_percentage"
    #   t.datetime "created_at", null: false
    #   t.datetime "updated_at", null: false
    # end  drop it 
  end

  def suggestions_for_co
    
  end

  private
  def calculate_suggestions
    #pick skillset from co. and userprofile and calc
    @job_profiles = JobProfile.all
    @user_profiles = UserProfile.all
  end
end
