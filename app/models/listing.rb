class Listing < ApplicationRecord
  belongs_to :profile
  belongs_to :category, optional: true

  
end
