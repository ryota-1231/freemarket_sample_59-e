class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
    redirect_to item_path(@item)   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.permit(:text, :item_id)
  end
end
