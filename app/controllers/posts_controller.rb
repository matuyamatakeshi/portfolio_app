class PostsController < ApplicationController

  before_action :target_post, only: %i[show edit update destroy]
  
  def index 
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).order(updated_at: :desc)
  end

  def new
    @post = Post.new(flash[:post])
  end

  def show
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path, flash: { notice: "新規投稿しました！" }
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages }
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post), flash: { notice: "#{@post.title}の投稿内容を更新しました" }
  end

  def destroy
    @post.delete
    redirect_to posts_path, flash: { alert: "#{@post.title}の投稿を削除しました" }
  end

  private

  def post_params
    params.require(:post).permit(:name, :title, :body, :image, :cname, :fee, :information)
  end

  def target_post
    @post = Post.find(params[:id])
  end

end
