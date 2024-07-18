class ProjectsController < ApplicationController


  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    redirect_to project_path(@project)

  end

  private

  def project_params
    params.require(:project).permit(:project_name)
  end
end
