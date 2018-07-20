class StaticPagesController < ApplicationController
  def home
    if logged_in?
      feed_item = current_user.feed.includes(:likes, user: :likes) # n+1回避
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
