class Users::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: { error: 'User not found' }, status: 403 #forbidden403
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: { error: 'User already exists' }, status: 403
    end
  end

  def update 
    if @user
      if @user.update(user_params)
        render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes] , status: 200
      else 
        render json: @user.errors_full_messages
      end
    else
      render json: "user not found", status: 404
    end
  end 

  def destroy
    if @user
      render json: @user, status: 200
      @user.delete
      render json: { message: 'User Deleted Successfully' }, status: 200
    else
      render json: { error: 'User not found' }, status: 403
    end
  end

  private

  def set_user
    @user = User.find(params[:id])    
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
