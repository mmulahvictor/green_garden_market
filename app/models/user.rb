class User < ApplicationRecord
  # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :products, through: :reviews
  has_many :orders
  has_many :addresses
end
