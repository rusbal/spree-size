# class Spree::Size < ApplicationRecord

class Spree::Size < Spree::Base
  has_many :product_sizes, class_name: 'Spree::ProductSize'
  has_many :products, :through => :product_sizes

  has_one_attached :video
  has_one_attached :image

  validates :name, :presence => true
  validates :min, :presence => true, :numericality => { :only_integer => true }
  validates :max, :presence => true, :numericality => { :only_integer => true }
  validates_numericality_of :max, :greater_than => :min

  def image_tag
    ActionController::Base.helpers.image_tag(image)
  end
end