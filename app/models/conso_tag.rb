class ConsoTag < ApplicationRecord
  has_many :wine_consos, dependent: :destroy

  validates :conso_name, presence: true

end
