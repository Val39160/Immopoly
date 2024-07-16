class Property < ApplicationRecord
  belongs_to :project
  belongs_to :city
end
