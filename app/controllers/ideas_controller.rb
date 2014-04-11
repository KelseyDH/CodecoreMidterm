class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea,
                only: [:edit]


  def index

    @ideas = Idea.all
  end


  def create
    @idea = current_user.ideas.new(idea_attributes)

    @idea = Idea.new(idea_attributes)

     if  @idea.save
      flash[:notice] = "Your idea was created successfully!"
      redirect_to root_path
    else
      flash.now[:error] = "Could not create idea"
      redirect_to root_path
    end

  end


  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:idea_id] || params[:id])
    @comment = Comment.new
    @comments = @idea.comments
  end



  private

  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_attributes
    idea_attributes = params.require(:idea).permit([:title, :description])
  end


end
