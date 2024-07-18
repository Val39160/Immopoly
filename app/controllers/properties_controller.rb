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


end
