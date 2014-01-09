class CategoriesController < ApplicationController
before_action :require_user, only: [:new, :create]

def index
  	@category = Category.all
end

  def show
  	@category = Category.find_by slug: (params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

  		if @category.save
        flash[:notice] = "Category has been created"
    	redirect_to posts_path
  		else
    	render 'new'
  		end

  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
 
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
