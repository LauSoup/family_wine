class Region < ApplicationRecord
  has_many :wines

  validates :region_name, presence: true

  def self.random
    @regions = Region.all
    @regions.sample
  end
  
end
