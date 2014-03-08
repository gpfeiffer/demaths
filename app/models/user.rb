class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_id

  has_many :roles
  belongs_to :role

  def type
    role && role.profile_type
  end

  def admin?
    type == "Admin"
  end

  def member?
    type == "Member"
  end

  def student?
    type == "Student"
  end
end
