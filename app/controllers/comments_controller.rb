class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		user = current_user.id
		@comment = @post.comments.create(user_id: user, post_id: @post, content: comment_params[:content])
		@comment.save
		redirect_to post_path(@post)
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
