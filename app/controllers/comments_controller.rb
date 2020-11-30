class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:show]
  #before_action :authenticate_admin!, expect: [:show]

  def index
    @search = Search.find_by(params[:search_id])
    @comments = Comment.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @search = Search.find_by(params[:search_id])
    @comment = Comment.new
  end

  def create
    @search = Search.find_by(params[:search_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to search_comment_path(@search, @comment)
    else
      "new"
    end
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  def update
    if @comment.update(comment_params)
      redirect_to search_comment_path(@search, @comment)
    else
      render 'edit'
    end
  end

  private
  def set_comment
    @search = Search.find_by(params[:search_id])
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :damage, #被害額
      :message, #事前キャンセル料がかかることを伝えているか？
      :request, #キャンセル保証申請
      :before, #予約時の対応
      :after, #予約後の対応
      :remark #備考
      )
  end
end
