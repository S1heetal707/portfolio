class ProjectController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
	end

	def destroy
	end

	private

	def project_params
		params.require(:project).permit(:title, :description, :technology)
	end

end
