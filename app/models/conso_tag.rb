class ConsoTag < ApplicationRecord
  has_many :wine_consos, dependent: :destroy
end
