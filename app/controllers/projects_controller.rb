class ProjectsController < ApplicationController

  def create
    raise
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    redirect_to project_path(@project)
  end

  def show
    @project = Project.find(params[:id])
    @properties = @project.properties
    @city = @properties.first&.city
    @regulations = @city&.regulations
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: 'Costs updated successfully.'
    else
      render :show
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :demolition_cost, :construction_cost)
  end
end
