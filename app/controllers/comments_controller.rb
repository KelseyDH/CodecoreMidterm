class CommentsController < ApplicationController

  before_action :find_idea
    def create
      @comment = @idea.comments.new(comment_attributes)
      @comment.user = current_user
      if @comment.save
        redirect_to @idea, notice: "Comment saved!"
      else
        redirect_to @idea, alert: "Comment not saved!"
      end
    end

    def destroy
      #find_idea replaced need for:  @idea = idea.find(params[:idea_id])
      @comment = @idea.comments.find(params[:id])

      ##Checks eligibility of current user
      if @comment.user == current_user && @comment.destroy
        redirect_to @idea, notice: "comment Deleted"
      else
        redirect_to @idea, alert: "We had trouble deleting the comment"
      end 
    end


    private

    def comment_attributes
      params.require(:comment).permit([:body])
    end

    def find_idea
      @idea = Idea.find params[:idea_id]
    end
end
