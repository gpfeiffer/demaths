class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :published_at, :title

  belongs_to :author, :class_name => 'Role'

  # find the top n posts according to some order
  def self.top n
    Post.all.sort_by(&:published_at).last n
  end
end
