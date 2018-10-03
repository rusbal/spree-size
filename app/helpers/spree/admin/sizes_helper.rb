module Spree::Admin::SizesHelper
  def resize_image(file, size = 300)
    image_tag(main_app.url_for(file.variant(resize: size)))
  end

  def show_video(file)
    video_tag(main_app.url_for(file), controls: true)
  end

  def size_products_count(size, on_zero = '-')
    count = size.products.count
    count === 0 ? on_zero : count
  end
end
