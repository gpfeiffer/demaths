class Student < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :last_name

  default_scope :order => [:last_name, :first_name]

  has_one :role, :as => :profile, :dependent => :destroy
  has_one :user, :through => :role

  def first_last
    "#{first_name} #{last_name}"
  end

  def name
    first_last
  end

  def to_s
    name
  end
end
