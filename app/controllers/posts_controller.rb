class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
			flash[:notice] = "Your Post has been created"
		else
			flash.now[:error] = "Fill the fields	"
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(posts_params)
			redirect_to posts_path
			flash[:notice] = "Your Post has been updated"
		else
			render :new
			flash[:error] = "Fill the fields	"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def posts_params
		params.require(:post).permit(:title, :description, :published_at)
	end
end