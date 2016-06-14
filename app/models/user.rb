class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	mount_uploader :avatar, AvatarUploader
	mount_uploader :cover, CoverUploader

	has_many :projects, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
	has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

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

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def favorite_projects
    projects = []
    self.favorites.each do |favorite|
      projects << Project.find(favorite.project_id)
    end
    return projects
  end

end
