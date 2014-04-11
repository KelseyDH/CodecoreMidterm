class LikesController < ApplicationController

before_action :authenticate_user!
#links voting action to user account


  def create
    @idea = Idea.find(params[:idea_id])
    @like = @idea.likes.new(like_params)
    @like_user = current_user
    if @like.save
      redirect_to @idea, notice: "Thank you for voting!"
    else
      redirect_to @idea, alert: "Your like wasn't recorded!"
    end
  end

  def update
    @like = current_user.likes.find(params[:id])
    if @like.update_attributes(like_params)
      redirect_to @idea, notice: "like Updated!"
    else
      redirect_to @idea, notice: "like wasn't updated!"
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @likes.destroy
      redirect_to @idea, notive: "like removed!"
    else
      redirect_to @idea, alert: "like could not be removed!"
    end
  end

  private

  def like_params
    params.require(:like).permit(:is_up)
  end

  def find_idea
   @idea = idea.find(params[:idea_id])
  end





end
