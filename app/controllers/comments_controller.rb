class CommentsController < ApplicationController

  before_filter :require_login
  respond_to :js, :json

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user_id  = current_user.id
    @comment.patron_id  = current_patron.id
    @comment.patron_token  = current_patron.token

    @comment.save!
    respond_with @comment, :success => "Comment added"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
