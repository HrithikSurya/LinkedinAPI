class SuggestionsController < ApplicationController
  def index
    # show the suggestions
    @suggestions = Suggestion.all
    
    # @suggestions = JobProfile.preload(:user_profiles).references(:user_profiles) #not working
    render json: @suggestions, status: 200
    # render json: SuggestionSerializer.new(@suggestions).serializable_hash[:data][:attributes]
  end

  private
  def calculate_suggestions
    #pick skillset from co. and userprofile and calc
    @job_profiles = JobProfile.all
    @user_profiles = UserProfile.all
  end
end
