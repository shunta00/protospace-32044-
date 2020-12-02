class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :contributor_confirmation, only: [:edit, :update, :show]
  
  
  def index
    @prototype = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototypes_parameters)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit  
  end

  def update
    if @prototype.update(prototypes_parameters)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    render :index
  end

  private

  def prototypes_parameters
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation
      redirect_to root_path unless current_user == @prototype.user
  end
end