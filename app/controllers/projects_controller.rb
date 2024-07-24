class ProjectsController < ApplicationController
  # Method to create a new project
  def create
    @project = Project.new(project_params) # Initialize a new Project object with parameters from the form
    @project.user = current_user # Associate the project with the current user

    if @project.save # Save the project to the database
      update_metrics(@project) # Update the project's metrics after saving
      redirect_to project_path(@project) # Redirect to the project's show page
    else
      render :new # Render the new project form again if saving fails
    end
  end

  # Method to display a specific project
  def show
    @project = Project.find(params[:id]) # Find the project by its ID
    @properties = @project.properties # Get the properties associated with the project
    @city = @properties.first&.city # Get the city of the first property, if it exists
    @regulations = @city&.regulations # Get the regulations for the city, if it exists
  end

  # Method to update an existing project
  def update
    @project = Project.find(params[:id]) # Find the project by its ID
    if @project.update(project_params) # Update the project with new parameters from the form
      update_metrics(@project) # Update the project's metrics after updating
      redirect_to @project, notice: 'Project updated successfully.' # Redirect to the project's show page with a success notice
    else
      render :edit # Render the edit project form again if updating fails
    end
  end

  private

  # Method to permit only allowed parameters for a project
  def project_params
    params.require(:project).permit(:project_name, :demolition_cost, :construction_cost, property_ids: []) # Permit project parameters and an array of property IDs
  end

  # Method to update the metrics of a project based on its properties
  def update_metrics(project)
    project.area_sqm_land = project.properties.sum(:area_sqm_land) # Sum of the land area of all properties
    project.area_sqm_livable = project.properties.sum(:area_sqm_livable) # Sum of the livable area of all properties

    # Calculate the total weighted floor area ratio
    total_weighted_ratio = project.properties.inject(0) do |sum, property|
      sum + (property.floor_area_ratio * property.area_sqm_land) # Add the product of the floor area ratio and land area of each property to the sum
    end

    project.floor_area_ratio = total_weighted_ratio / project.area_sqm_land # Calculate the weighted average floor area ratio
    project.save # Save the updated project to the database
  end
end
