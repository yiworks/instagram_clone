class LikesController < ApplicationController

  # TODO likesをユニークにする
  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_to request.referrer || root_url
    # TODO ajax化したい
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end
  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy
    redirect_to request.referrer || root_url
    # TODO ajax化したい
    # respond_to do |format|
    #   format.html { redirect_to request.referrer || root_url }
    #   format.js
    # end
  end
end
