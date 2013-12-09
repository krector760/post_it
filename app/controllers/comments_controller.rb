class CommentsController < ApplicationController

def index
  	@comments = Comment.all
end

  def show
  	@comments = Comment.find(params[:id])
  end

  def new
  	@comments = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:user_id, :body))
    redirect_to post_path(@post)
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
 
  end

  private
  def post_params
    params.require(:comment).permit(:user_id, :body)
  end


end
