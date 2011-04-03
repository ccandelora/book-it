class CommentsController < ApplicationController
  before_filter :load_tenant

  def create
    @comment = @tenant.comments.new(params[:comment])
    if @comment.save
      redirect_to @tenant, :notice => 'Thanks for your comment'
    else
      redirect_to @tenant, :alert => 'Unable to add comment'
    end
  end
  
  def destroy
    @comment = @tenant.comments.find(params[:id])
    @comment.destroy
    redirect_to @tenant, :notice => 'Comment deleted'
  end
  
  private
    def load_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end
end
