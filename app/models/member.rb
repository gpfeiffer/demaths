class Member < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :last_name
end