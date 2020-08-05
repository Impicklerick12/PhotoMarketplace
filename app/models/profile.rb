class Profile < ApplicationRecord
    belongs_to :user
    has_many :listings, dependent: :destroy
    has_one_attached :photo
    has_many :reviews, dependent: :destroy
  end
  