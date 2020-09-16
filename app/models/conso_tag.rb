class ConsoTag < ApplicationRecord
  has_many :wine_consos, dependent: :destroy

  validates :conso_name, presence: true

  def self.random
    @consos = ConsoTag.all
    @consos.sample
  end

end
