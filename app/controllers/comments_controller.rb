class CommentsController < ApplicationController
  # def new
  #   @item = Item.find(params[:item_id])
  #   @comment = Comment.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(create_params)
    if  @comment.save
        redirect_to item_path(@item)
    end
  end

  private
  def create_params
    params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end

