class PostsController < ApplicationController
	def index
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end
	
	def create
		@user = User.find(params[:user_id])
		@user.posts.create(post_params)
		redirect_to user_path(current_user)
	end

	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to user_path(params[:user_id])
	end




	private
	def post_params
		params.require(:post).permit(:image_url, :post_type)
	end



	
end