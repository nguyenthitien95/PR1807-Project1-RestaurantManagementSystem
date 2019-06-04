class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "please check your email to reset password!"
      redirect_to root_url
    else
      flash[:danger] = "email is not valid"
      render "new"
    end
  rescue Net::OpenTimeout
    flash[:danger] = "request timeout!"
    render "new"
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add :password, "can't be empty"
      render "edit"
    elsif @user.update_attributes user_params
      log_in @user
      flash[:success] = "password has beed reset"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  # Before filters

  def get_user
    @user = User.find_by email: params[:email]
  end

  # Confirms a valid user.
  def valid_user
    return if @user && @user.activated? &&
      @user.authenticated?(:reset, params[:id])
    redirect_to root_url
  end

  # Checks expiration of reset token.
  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = "Password reset has expired."
    redirect_to new_password_reset_url
  end
end
