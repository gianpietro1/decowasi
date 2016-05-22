class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	mount_uploader :avatar, AvatarUploader
	mount_uploader :cover, CoverUploader

	has_many :projects, dependent: :destroy
  has_many :likes, dependent: :destroy

  def admin?
    role == 'admin'
  end
  
  def professional?
    role == 'professional'
  end

  def store?
    role == 'store'
  end

  def consumer?
    role == 'consumer'
  end

  def followers
  	1
  end

	def favorited(project) 
    favorites.where(project_id: project.id).first
  end

end
