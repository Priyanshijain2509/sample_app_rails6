class AccountActivationsController < ApplicationController

  # def edit
  #   user = User.find_by(email: params[:email])
  #   # debugger
  #   if user && !user.activated? && user.authenticated?(:activation, params[:id])
  #     user.activated?
  #       log_in user
  #       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #       redirect_back_or user
  #     else
  #       message = "Account not activated. "
  #       message += "Check your email for the activation link."
  #       flash[:warning] = message
  #       redirect_to root_url
  #     end
  #   else
  #     flash[:danger] = "Invalid activation link"
  #     redirect_to root_url
  #   end
  # end


  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
