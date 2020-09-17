class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :wines
  has_many :favorites, dependent: :destroy

  validates :pseudo, uniqueness: true
  validates :pseudo, presence: true

  has_one_attached :photo

end
