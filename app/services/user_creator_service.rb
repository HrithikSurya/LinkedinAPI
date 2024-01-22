class UserCreatorService
  
  def initialize(params)
    @name = params[:name]
    @role = params[:role]
  end

  def call
    UserCreatorService.new
  end

end
