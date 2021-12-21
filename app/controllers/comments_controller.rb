class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @comment.save
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.comments.find(params[:id])
    comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
