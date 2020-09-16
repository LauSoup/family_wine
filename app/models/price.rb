class Price < ApplicationRecord
  has_many :wines

  validates :price_fork, presence: true

  def self.random
    @price = Price.all
    @price.sample
  end

end
