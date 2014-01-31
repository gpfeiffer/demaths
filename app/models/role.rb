class Role < ActiveRecord::Base
  attr_accessible :profile_id, :profile_type, :user_id
end
