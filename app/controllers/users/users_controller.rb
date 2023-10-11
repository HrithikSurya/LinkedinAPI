class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    # debugger
    @user = User.find(params[:id])
    if @user.present
      render json: @user, status: 200
    else
      render json: { error: 'User not found' }, status: 403
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
    @user = User.find(params[:id])
    if @user
      render json: @user, status: 200
    else
      render json: { error: 'User not found' }, status: 403
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      render json: @user, status: 200
      @user.delete
      render json: { message: 'User Deleted Successfully' }, status: 200
    else
      render json: { error: 'User not found' }, status: 403
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
