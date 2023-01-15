class Product < ApplicationRecord
  has_many :reviews
  has_many :orders, through: :reviews
  has_many :users, through: :reviews
  belongs_to :farmer, optional: true
  belongs_to :category, optional: true
  has_one :inventory
end