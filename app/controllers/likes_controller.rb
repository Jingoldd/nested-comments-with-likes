class LikesController < ApplicationController
  # When making likes polymorphic, post becomes likeable
  before_action :authenticate_user!

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_to @like.likeable, notice: "Liked!"
    else
      flash[:notice] = @like.errors.full_messages.to_sentence
    end 
  end 

  def destroy
    @like = current_user.likes.find(params[:id]) #current_user ensures a user can't delete another user likes
    likeable = @like.likeable #ensures reference to the post
    @like.destroy
    redirect_to likeable
  end

  private

  def like_params # When making likes polymorphic, likeable_type should be added
    params.permit(:likeable_id, :likeable_type) #create method through current_user already sets user_id   
  end  
end
