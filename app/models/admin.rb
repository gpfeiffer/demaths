class Admin < ActiveRecord::Base
  attr_accessible :name

  has_one :role, :as => :profile, :dependent => :destroy

  def user
    role.user
  end

  def to_s
    name
  end
end
