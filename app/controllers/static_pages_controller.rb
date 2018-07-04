class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
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
