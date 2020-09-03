class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    def index
      @reviews = Review.all
    end

    def show
      @review = Review.find(params[:id])
    end

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      if @review.save
        redirect_to reviews_path
      else
        render 'new'
      end
    end

    def edit
      @review = Review.find(params[:id])
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
       redirect_to reviews_path
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to reviews_path
      else
        render 'edit'
      end
    end

    def import
      cnt = Review.import(params[:file])
      redirect_to eateries_url, notice:"#{cnt}件登録されました。"
    end

    private
    def review_params
      params.require(:review).permit(
        :delicious_score, #美味しさ
        :mood_score, #ムードスコア
        :cost_performance_score, #コストパフォーマンススコア
        :service_score, #サービススコア
        :imagination_score, #イマジネーションスコア
        :original1,
        :original1_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :original2,
        :original2_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :revisit, #再訪したいレベルか？
        :average_price, #平均金額
        :title, #タイトル
        :keyword, #キーワード
        :description, #説明
        :body, #本文
        :day,
        :image_1, #ファイル
        :image_2, #ファイル
        :image_3, #ファイル
        :image_4, #ファイル
        :image_5, #ファイル
        :image_6, #ファイル
        :image_7, #ファイル
        :image_8, #ファイル
        :image_9, #ファイル
        :image_10, #ファイル
        )
    end
end
