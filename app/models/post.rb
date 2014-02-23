class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :published_at, :title

  belongs_to :author, :class_name => 'Role'
end
