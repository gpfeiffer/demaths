class Admin < ActiveRecord::Base
  attr_accessible :name

  has_one :role, :as => :profile, :dependent => :destroy
  has_one :user, :through => :role

  def to_s
    name
  end
end
