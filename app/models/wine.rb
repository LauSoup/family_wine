class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :price
  belongs_to :region

  has_many :favorites, dependent: :destroy
  has_many :wine_consos, dependent: :destroy

  validates :name, :country, presence: true
  validates :name, uniqueness: true

  COUNTRIES = ["France", "Italie", "Espagne", "Etats-Unis", "Argentine", "Australie", "Chili", "Allemagne", "Afrique du Sud", "Chine"]
  validates :country, inclusion: { in: COUNTRIES }

  

  def self.random
    @wines = Wine.all
    @wines.sample
  end
end
