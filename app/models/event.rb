class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  validates :name,
            :location,
            :description,
            :website,
            :featured_image,
            :start_date,
            :end_date,
            :lat,
            :lon,
            presence: true
end