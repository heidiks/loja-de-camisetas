class Product < ActiveRecord::Base

  validates :quantity, presence: true
  validates :name, length: { minimum: 5 }
end
