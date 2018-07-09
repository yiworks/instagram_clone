class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  def new
    if params[:back]
      @post = current_user.posts.build(post_params)
    else
      @post = current_user.posts.build
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      PostMailer.post_mail(@post).deliver
      flash[:success] = "投稿しました！"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "編集しました"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo, :photo_cache)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
