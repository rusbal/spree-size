Spree::Product.class_eval do
  has_many :product_sizes, class_name: 'Spree::ProductSize'
  has_many :sizes, :through => :product_sizes
end