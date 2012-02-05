class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => t("login.msg.loginsuccess")
    else
      flash.now[:alert] = t("login.msg.invalidcredentials")
      render :action => 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end  
end
