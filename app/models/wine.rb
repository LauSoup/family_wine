class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :price
  belongs_to :region

  has_many :favorites, dependent: :destroy
  has_many :wine_consos, dependent: :destroy

  validates :name, :country, :category, presence: true
  validates :name, uniqueness: true

  COUNTRIES = ["France", "Italie", "Espagne", "Etats-Unis", "Argentine", "Australie", "Chili", "Allemagne", "Afrique du Sud", "Chine"]
  validates :country, inclusion: { in: COUNTRIES }

  CATEGORIES = ["Rouge", "Blanc", "Champagne / Mousseux", "Rosé", "Autre vin", "Autre alcool"]
  validates :category, inclusion: { in: CATEGORIES }

  has_one_attached :photo

  def self.random
    @wines = Wine.all
    @wines.sample
  end

  def self.countries
    @countries = COUNTRIES
  end

  def self.categories
    @categories = CATEGORIES
  end
end
