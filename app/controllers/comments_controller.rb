class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = current_user.comments.new
  end 

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: "Thanks for your comment!"
    else 
      redirect_to post_path(params[:post_id]), notice: @comment.errors.full_messages.to_sentence
    end 
  end 

  private

  def comment_params
    params.permit(:content).merge(post_id: params[:post_id])
  end 
end
