class Institution < ActiveRecord::Base
  attr_accessible :location, :name

  default_scope :order => [:location, :name]
end
