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
		if @post.save
			flash[:success] = t('posts.create')
			redirect_to post_path(@post)
		else
			flash[:danger] = t('posts.error')
			redirect_to new_post_path
		end
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
		@post = Post.find_by_id(params[:id])
	end

	def ditumner
		@post = Post.find(params[:id])
		if @post.ditum.present?
		@view = @post.ditum.ditumner + 1
		@post.ditum.update(ditumner: @view)
		redirect_to post_path(@post)
		else
			@views = @post.create_ditum(ditumner: 1)
			@views.save
			redirect_to post_path(@post)
		end
	end

	private

	
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
