class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  before_action :correct_user?, only: :destroy

  # def create
  #   @micropost =  Micropost.find(params[:micropost_id])
  #   @comment = @micropost.comments.build(comment_params)
  #   @comment.user = current_user

  #   if @comment.save
  #     flash[:success] = "Comment created!"
  #   else
  #     flash[:error]= "Comment can't be created!"
  #   end
  #   redirect_to request.referrer || root_url
  # end

  # def destroy
  #   @comment.destroy
  #   flash[:success] = "Comment deleted"
  #   redirect_to request.referrer || root_url
  # end

  def create
    @micropost =  Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment created!"
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js 
      end
    else
      flash[:error]= "Comment can't be created!"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @micropost =  Micropost.find(params[:micropost_id])
    @comment.user = current_user
    
    if @comment.destroy
      flash[:success] = "Comment destroyed!"
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
  
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user?
    @comment = Comment.find_by(id: params[:id])
    @comment.user == current_user 
  end
end