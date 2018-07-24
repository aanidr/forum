class TopicsController < ApplicationController
	before_action :logged_in, except: [:index, :show]
	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new topic_params
		@topic.user_id = current_user.id
		if @topic.save
			redirect_to topics_path
		else
			render 'new'
		end
	end

	def show
		@topic = Topic.find params[:id]
	end

	def destroy
		Topic.find(params[:id]).destroy
	end

	private
		def topic_params
			params.require(:topic).permit(:name)
		end
end
