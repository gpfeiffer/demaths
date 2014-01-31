class Member < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :last_name

  def first_last
    "#{first_name} #{last_name}"
  end
end
