class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post), flash: { notice: "コメントしました！" }
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), flash: { alert: "コメントを削除しました" }
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
  
end
