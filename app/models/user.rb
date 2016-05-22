class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

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


end
