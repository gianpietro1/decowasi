class Slider < ActiveRecord::Base

	mount_uploader :image, SlideUploader

end
