class Featured < ActiveRecord::Base

	mount_uploader :image, FeaturedUploader

end
