class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :omniauthable
            include DeviseTokenAuth::Concerns::User
  has_many :reviews
  has_many :products, through: :reviews
  has_many :orders
  has_many :addresses
end