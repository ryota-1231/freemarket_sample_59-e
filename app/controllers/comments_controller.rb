class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(create_params)
    redirect_to item_path(@item)
  end

  private
  def create_params
    params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end

