class PostsController < ApplicationController
	before_action :logged_in
	
	def create
		@topic = Topic.find params[:topic_id]
		@post = @topic.posts.new(posts_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to topic_path(@topic)
	end

	def destroy
		post = Post.find_by(id: params[:post_id])
		post.destroy if post
	end

	private
		def posts_params
			params.require(:post).permit(:name, :body)
		end

end
