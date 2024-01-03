module ExceptionHandling
  extend ActiveSupport::Concern
  
  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: e, status:404
    end

    rescue_from CanCan::AccessDenied do |exception|
      render json: exception, status:401
    end

    rescue_from ActionController::RoutingError, with: :render_404
    
    rescue_from ArgumentError do |error|
      render json: { message: error } ,status: 200
    end

  end
  
  private

  def render_404
    render json: 'errors/404', status: 404
  end

end
