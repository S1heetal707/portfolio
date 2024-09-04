class Project < ApplicationRecord
	# has_one_attached :image
	has_one_attached :image

	def resized_image
    image.variant(resize_to_limit: [100, 100]).processed
  end
end