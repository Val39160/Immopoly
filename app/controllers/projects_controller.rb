class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      update_metrics(@project)
      redirect_to project_path(@project)
    else
      render :new
    end
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
      update_metrics(@project)
      redirect_to @project, notice: 'Project updated successfully.'
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :demolition_cost, :construction_cost, property_ids: [])
  end

  def update_metrics(project)
    project.area_sqm_land = project.properties.sum(:area_sqm_land)
    project.area_sqm_livable = project.properties.sum(:area_sqm_livable)

    total_weighted_ratio = project.properties.inject(0) do |sum, property|
      sum + (property.floor_area_ratio * property.area_sqm_land)
    end
    project.floor_area_ratio = total_weighted_ratio / project.area_sqm_land
    project.save
  end
end
