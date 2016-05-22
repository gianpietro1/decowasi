class Project < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, ProjectUploader
  has_many :likes, dependent: :destroy
end
