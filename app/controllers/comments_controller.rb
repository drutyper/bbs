class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    authorize! :create, @comment
  end

  def create
    @comment = @post.comments 
    @comment = current_user.comments
    authorize! :create, @comment
  
    if @comment.save
      flash[:notice] = "Comment was created"
    else
      flash[:error] = "There was a problem posting your comment"
    end
  end

  def edit
    authorize! :update, @comment
  end

  def destroy
    authorize! :destroy, @comment
    @comment.destroy
  end
end

