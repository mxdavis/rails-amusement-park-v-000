class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Account created successfully'
    else
      flash[:error] = 'An error occured!'
      render :new
    end
  end

  def show 
    user = User.find_by(id: params[:id])
    if user == current_user
      render :show
    else
      redirect_to root_path, notice: 'You are not signed in'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
     params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
