# class Spree::Size < ApplicationRecord

class Spree::Size < Spree::Base
  has_many :product_sizes, class_name: 'Spree::ProductSize'
  has_many :products, :through => :product_sizes

  has_one_attached :image

  def image_tag
    ActionController::Base.helpers.image_tag(image)
  end
end