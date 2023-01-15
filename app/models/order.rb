class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :address
  has_one :payment
end