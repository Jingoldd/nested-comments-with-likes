class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_to post_path(params[:post_id]), notice: 'Post liked!'
    else
      flash[:notice] = @like.errors.full_messages.to_sentence
    end 
  end 

  def destroy
    @like = current_user.likes.find(params[:id]) #current_user ensures a user can't delete another user likes
    post = @like.post #ensures reference to the post
    @like.destroy
    redirect_to post
  end

  private

  def like_params
    params.require(:like).permit(:post_id) #create method through current_user already sets user_id   
  end  
end
