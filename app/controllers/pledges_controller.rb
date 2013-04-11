class PledgesController < ApplicationController
	def create
		@project     = Project.find params[:project_id]
		@pledge      = @project.pledges.build params[:pledge]
		@pledge.user = current_user

		if !current_user
			redirect_to new_session_path, alert: "Please sign in to make a pledge."
		elsif @pledge.save
			redirect_to @project, notice: "Nice! Thanks for pledging $#{@pledge.amount} for this project."
		else
			render 'projects/show'
		end
	end
end
