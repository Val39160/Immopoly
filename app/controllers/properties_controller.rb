class PropertiesController < ApplicationController


  def index
    @properties = Property.all
    @property = Property.new
    @project = Project.new
    @cities = City.all

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end

    selected_property_ids = params[:property_ids]
    if selected_property_ids.present?
      @selected_properties = Property.where(id: selected_property_ids)
    else
      @selected_properties = []
    end

  end

  def show
    @property = Property.find(params[:id])
  end



  def create

    @property = Property.new(property_params,)
    if @property.save!
      redirect_to properties_path
    else
      render :new
    end
  end

  private

  def property_params # strong params
    params.require(:property).permit(:city_id, :address, :street_number, :street_name, :zipcode, :building_height_floors, :nb_rooms_per_dwelling, :energy_class, :area_sqm_land, :year_construction, :area_sqm_livable, :floor_area_ratio, :nb_dwelling, :density_area, :building_zone)
  end
end
