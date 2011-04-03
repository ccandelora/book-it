class CommentsController < ApplicationController
  before_filter :load_tenant, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create
    @comment = @tenant.comments.new(params[:comment])
    @comment.user_id = current_user
    if @comment.save
      redirect_to @tenant, :notice => 'Thanks for your comment'
    else
      redirect_to @tenant, :alert => 'Unable to add comment'
    end
  end
  
  def destroy
    # Check if comment is posted by current user
    @comment = current_user.comments.find(params[:id])
    @tenant = @comment.tenant
    @comment.destroy
    redirect_to @tenant, :notice => 'Comment deleted'
  end
  
  private
    def load_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end
end
