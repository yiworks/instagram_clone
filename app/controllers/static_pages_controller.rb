class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      feed_item = current_user.feed.includes(:user) # n+1回避
      @feed_items = feed_item.paginate(page: params[:page]) # n+1回避
    else
      @user = User.new
    end

    if params[:back]
      params.require(:post).permit(:content, :photo_cache)
    end
  end

  def help
  end
end
