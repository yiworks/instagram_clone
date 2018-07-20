class LikesController < ApplicationController

  # TODO likesをユニークにする
  def create
    post_user_id = Post.find(params[:post_id]).user_id
    if post_user_id != current_user.id
      current_user.likes.create(post_id: params[:post_id])
      @post = Post.find(params[:post_id])
    end
  end

  def destroy
    post_user_id = Post.find(params[:post_id]).user_id
    if post_user_id != current_user.id
      current_user.likes.find_by(post_id: params[:post_id]).destroy
      @post = Post.find(params[:post_id])
    end
  end
end
