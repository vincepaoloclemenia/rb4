class ManifoldsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_manifold, only: [:edit, :update, :destroy]

  def index
  	@manifolds = Manifold.all
  	@manifold = Manifold.new
  end

  def update
    if @manifold.update(manifold_params)
      redirect_to manifolds_path, notice: "Successfully Edited"
    else
      flash[:alert] = @manifold.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
  	@manifold = Manifold.find(params[:id])
  end

  def create
  	@manifold = Manifold.new(manifold_params)
  	if @manifold.save
  		redirect_to manifolds_path, notice: "Entry Created"
  	else
  		flash[:alert] = @manifold.errors.full_messages.join(', ')
  		render 'new'
  	end
  end

  def destroy
    @manifold.destroy
    redirect_to manifolds_path, notice: 'Successfully Deleted'
  end

  private	
  	def set_manifold
  		@manifold = Manifold.find(params[:id])
  	end

  	def manifold_params
  		params.require(:manifold).permit(:name, :description, :is_active)
  	end
end
