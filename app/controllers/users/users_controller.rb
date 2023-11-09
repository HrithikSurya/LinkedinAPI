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
      render_user_serializer(@user)
    else
      render_not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render_user_serializer(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    if @user
      if @user.update(user_params)
        render_user_serializer(@user)
      else
        render json: @user.errors.full_messages, status: 422
      end
    else
      render_not_found
    end
  end

  def destroy
    if @user
      if @user.destroy
        render json: { message: 'User Deleted Successfully' }, status: 200
      else
        render json: @user.errors.full_messages, status: 422
      end
    else
      render_not_found
    end
  end

  private

  def render_user_serializer(user)
    render json: UserSerializer.new(user).serializable_hash[:data][:attributes], status: 200
  end

  def set_user
    @user = User.find(params[:id])
  end

  def render_not_found
    render json: "user not found", status: 404
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
