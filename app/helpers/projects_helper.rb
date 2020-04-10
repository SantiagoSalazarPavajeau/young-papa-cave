module ProjectsHelper

    def owner?
        project = Project.find(params[:id])
        if current_user == project.user
            true
        end
    end

end
