class SimulationsController < ApplicationController
  before_action :set_project, only: [:create, :show, :save]
  before_action :set_simulation, only: [:show, :save]
  before_action :set_city, only: [:show]

  def create
    # Fetch related data
    city = City.find(@project.properties.first.city_id)
    regulation = Regulation.find_by(city: city)
    properties = @project.properties

    # Calculations
    area_sqm_land = properties.sum(:area_sqm_land)
    area_sqm_construction = regulation.floor_area_ratio * area_sqm_land * regulation.building_height
    unit_cost = params[:unit_cost].to_d
    cost_destruction = unit_cost * area_sqm_construction
    area_sqm_common = area_sqm_construction * 0.10
    area_sqm_livable = area_sqm_construction - area_sqm_common

    # Create the simulation with calculated values
    @simulation = @project.simulations.new(
      area_sqm_livable: area_sqm_livable,
      price_total_livable: city.price_per_sqm_livable * area_sqm_livable,
      price_total_rental: city.price_per_sqm_rental * area_sqm_livable * 12,
      cost_destruction: cost_destruction,
      area_sqm_land: area_sqm_land,
      floor_area_ratio: regulation.floor_area_ratio,
      area_sqm_construction: area_sqm_construction,
      area_sqm_common: area_sqm_common,
      building_height_floors: regulation.building_height
    )

    if @simulation.save
      redirect_to project_simulation_path(@project, @simulation), notice: 'Simulation was successfully created.'
    else
      render 'projects/show'
    end
  end

  def show
    # This action should only display the simulation
  end

  def save
    if @simulation.update(simulation_params)
      redirect_to dashboard_path, notice: 'Simulation was successfully saved.'
    else
      redirect_to project_simulation_path(@project, @simulation), alert: 'Failed to save the simulation.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_simulation
    @simulation = Simulation.find(params[:id])
  end

  def set_city
    @city = @simulation.project.properties.first.city
  end

  def simulation_params
    params.require(:simulation).permit(:area_sqm_livable, :price_total_livable, :price_total_rental, :cost_destruction, :area_sqm_land, :floor_area_ratio, :area_sqm_construction, :area_sqm_common, :building_height_floors)
  end
end
