namespace :spree_sizes do

  desc "Copy video and image from any row from spree_sizes table that has media contents."
  task copy_media: :environment do
    if media_row.nil?
      puts "No Spree::Size media to copy."
    else
      copy_from_media_row
    end
  end

  def copy_from_media_row
    no_media_rows.each do |size|
      size.video.purge
      size.image.purge
      size.video.attach(media_row.video.blob) if media_row.video.attached?
      size.image.attach(media_row.image.blob) if media_row.image.attached?
      size.save
      puts " . saved media to #{size.name}"
    end
  end

  def no_media_rows
    Spree::Size.all.select{ |row| row.image.attached? === false }
  end

  def media_row
    @media_row ||= Spree::Size::order('name').joins(:image_attachment).first
  end

end
