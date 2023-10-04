class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  before_action :correct_user?, only: :destroy

  def create
    @micropost =  Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:error]= "Comment can't be created!"
    end
    redirect_to user_path(current_user)
  end

  def destroy
    puts "HELLLO"
    puts "#{@comment.id}"
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to user_path(current_user)
  end

  private

  def comment_params
    params.permit(:body)
  end

  def correct_user?
    @comment = Comment.find_by(id: params[:id])
    @comment.user == current_user 
  end
end
