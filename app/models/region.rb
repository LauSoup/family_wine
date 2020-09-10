class Region < ApplicationRecord
  has_many :wines

  validates :region_name, presence: true

end
