class Member < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :last_name

  default_scope :order => [:last_name, :first_name]

  def first_last
    "#{first_name} #{last_name}"
  end
end
