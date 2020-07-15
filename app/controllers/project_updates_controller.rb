class ProjectUpdatesController < ApplicationController

    def new
        @project_update = ProjectUpdate.new
        @project = Project.find(params[:project_id])
    end

    def create
        @project = Project.find(params[:project_id])
        @project_update = @project.project_updates.create(project_update_params)
        redirect_to @project
    end

    def destroy
        @project_update = ProjectUpdate.find(params[:id])
        @project = @project_update.project
        @project_update.delete
        redirect_to @project
    end

    private

    def project_update_params
        params.require(:project_update).permit(:description, :image, :image_url)
    end
end
