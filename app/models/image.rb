class Image < ActiveRecord::Base

  # Relationships
  has_many :image_details
  has_many :image_attachments

  def generate_image_folder_path
    self.id=~/(.{3})(.{3})(.{2})-(.{4})-(.{4})-(.{4})-(.{3})(.{3})(.{3})(.{3})$/
    "/IMG/#{$1}/#{$2}/#{$3}/#{$4}/#{$5}/#{$6}/#{$7}/#{$8}/#{$9}/#{$10}"
  end

  def self.save_images(images)
    image_status = []
    images.each do |img|
      uploaded_io = img
      image_name = uploaded_io.original_filename.split('.')[0]
      image = Image.create!(name: image_name, alt_tag: Util.encode_parser( image_name ))
      FileUtils.mkdir_p "#{Rails.root}/public/images#{image.generate_image_folder_path}", :mode => 0700

      File.open(Rails.root.join('public', 'images', "#{image.generate_image_folder_path[1..-1]}", uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      image.image_details.create!(name: image.name, alt_tag: image.alt_tag, logical_name: 'original', image_path: "/images#{image.generate_image_folder_path}/#{uploaded_io.original_filename}")
      image_status << { name: uploaded_io.original_filename, size: '12345' }
    end
    image_status
  end

  def get_image( width, height )
    image_details.by_dimensions( width, height ).first.try(:image_path) || create_resized_image( width, height )
  end

  private

  def create_resized_image( width, height )
    self.transaction do
      result = Magick::Image.read("#{Rails.root.join('public', 'images', generate_image_folder_path[1..-1], image_details.original_image.first.image_path.split('/')[-1])}").first.resize_to_fill( width, height)
      image_name = result.base_filename.split('/')[-1].split('.')[0]
      image_extension = result.base_filename.split('/')[-1].split('.')[-1]
      file_name = "#{image_name}-#{width}-#{height}"
      result.write(Rails.root.join('public', 'images', "#{generate_image_folder_path[1..-1]}", "#{file_name}.#{image_extension}"))
      resized_image = image_details.create!(name: file_name, alt_tag: self.alt_tag, logical_name: get_logical_name( width, height ), image_path: "/images#{generate_image_folder_path}/#{file_name}.#{image_extension}", width: width, height: height)
      resized_image.image_path
    end
  end

  def get_logical_name( width, height )
    if width == height
      'square'
    elsif width > height
      'landscape'
    elsif height > width
      'portrait'
    end
  end

end
