class MicropostsController < ApplicationController

	before_filter :authenticate

	def create
		@micropost = current_user.microposts.build(params.require(:micropost).permit(:content, :user_id))
		if @micropost.save
			redirect_to root_path, :flash => { :success => "Micropost created" }
		else
			render 'pages/home'
		end
	end

	def destroy
		
	end
end