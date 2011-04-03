class UsersController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to bookings_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def edit
    # Allow user to only edit himself
    @user = current_user
  end
  
  def update
    # Always write user credentials of current user
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to bookings_path, :notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
end