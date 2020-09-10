class Price < ApplicationRecord
  has_many :wines

  validates :price_fork, presence: true

end
