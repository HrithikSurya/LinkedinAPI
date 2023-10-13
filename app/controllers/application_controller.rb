class ApplicationController < ActionController::API
  load_and_authorize_resource
  #for loading the permissions and authorization of current user in all Controller acc. to my Project Requirements

end
