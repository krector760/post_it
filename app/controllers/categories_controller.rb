class CategoriesController < ApplicationController

def index
  	@categories = Category.all
end

  def show
  	@categories = Category.find(params[:id])
  end

  def new
  	@categories = Category.new
  end

  def create
  	@categories = Category.new(post_params)

  		if @categories.save
    	redirect_to action: 'index'
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
  def post_params
    params.require(:category).permit(:name,)
  end

end
