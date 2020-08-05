class Review < ApplicationRecord
    belongs_to :user
    belongs_to :profile
    validates :review, presence: true, allow_blank: false
  end
  