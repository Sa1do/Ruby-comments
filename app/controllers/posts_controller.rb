class PostsController < ApplicationController
	before_action :find_post, only: %i[ show edit update destroy ]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	end

	def show

	end

	def edit

	end

	def update
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end
	
	def find_post
		@post = Post.find(params[:id])
	end

	private

	
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
