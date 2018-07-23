class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :review

  validates_presence_of :name, presence: true
  validates_presence_of :price, presence: true
  validates_presence_of :quantity, presence: true
  validates_presence_of :category, presence: true

end
