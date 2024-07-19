class PropertiesController < ApplicationController


  def index
    @properties = Property.all
    @project = Project.new

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @cities = City.all
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  private

  def property_params # strong params
    params.require(:property).permit(:area_sqm_land, :year_construction, :area_sqm_livable, :floor_area_ratio, :nb_dwelling, :density_area, :building_zone)
  end
end
