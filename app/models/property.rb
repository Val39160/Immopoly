class Property < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :project, optional: true
  belongs_to :city
  belongs_to :user
end
