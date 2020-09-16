class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :price
  belongs_to :region

  has_many :favorites, dependent: :destroy
  has_many :wine_consos, dependent: :destroy

  validates :name, presence: true

  def self.random
    @wines = Wine.all
    @wines.sample
  end
end
