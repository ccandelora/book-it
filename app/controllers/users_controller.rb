class UsersController < ApplicationController
  
  before_filter :authenticate
  
  add_breadcrumb "Users", :users_path
    
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  
  def new
    add_breadcrumb "New", :users_path
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

    if is_admin?
      # Admin can edit all users
      @user = User.find(params[:id])
    else
      # Allow user to only edit himself      
      @user = current_user
    end

  end
  
  def update

    # if admin allow all users editable, 
    # else only edit current_user
      
    if is_admin?
      @user = User.find(params[:id])
    else 
      @user = current_user
    end
    
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    
    if @user == current_user
      redirect_to settings_path, :alert => 'You can not delete your self!'
    else
      @user.destroy
      redirect_to settings_path, :notice => 'User was deleted.'
    end
    
  end
  
end