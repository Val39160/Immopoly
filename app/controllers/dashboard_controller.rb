class DashboardController < ApplicationController
  def profile
    @projects = Project.where(user: current_user)
    @properties = Property.where(user: current_user)
  end
end
