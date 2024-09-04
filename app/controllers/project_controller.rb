class ProjectController < ApplicationController
	def index
		@projects = Project.all
	end

	def create
	  project = Project.new(project_params)
	  
	  if project.save
	    if params[:project][:image].present?
	      project.image.attach(params[:project][:image])
	      if project.image.attached?
	        render json: { message: "Project Created Successfully" }, status: :created
	      else
	        render json: { error: "Image attachment failed" }, status: :unprocessable_entity
	      end
	    else
	      render json: { message: "Project Created Successfully but no image was attached" }, status: :created
	    end
	  else
	    render json: { error: project.errors.full_messages.to_sentence }, status: :unprocessable_entity
	  end
	end

	def show
	end

	def destroy
	end

	private

	def project_params
		params.require(:project).permit(:title, :description, :technology, :image)
	end
end
