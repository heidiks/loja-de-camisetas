class Product < ActiveRecord::Base

  belongs_to :department

  validates :quantity, presence: true
  validates :name, length: { minimum: 5 }
end
