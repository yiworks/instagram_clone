class LikesController < ApplicationController

  # TODO likesをユニークにする
  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_to request.referrer || root_url
  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy
    redirect_to request.referrer || root_url
  end
end
