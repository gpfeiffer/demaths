class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @posts = Post.top(5)
  end
end
