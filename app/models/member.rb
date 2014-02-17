class Member < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :iris_url, :last_name

  default_scope :order => [:last_name, :first_name]

  has_one :role, :as => :profile, :dependent => :destroy

  def first_last
    "#{first_name} #{last_name}"
  end

  def user
    role.user
  end

  def name
    first_last
  end

  def to_s
    name
  end
end
