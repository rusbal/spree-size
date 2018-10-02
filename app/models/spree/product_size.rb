# class Spree::ProductSize < ApplicationRecord

class Spree::ProductSize < Spree::Base
  belongs_to :product, class_name: 'Spree::Product'
  belongs_to :size, class_name: 'Spree::Size'
end