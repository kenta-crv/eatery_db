class ReviewsController < ApplicationController
    before_action :set_eatery
    before_action :set_review, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
      @reviews = Review.all
      @eateries = Eatery.all
    end

    def show
      @review = Review.find(params[:id])
      @eatery = Eatery.find(params[:id])
    end

    def new
      @review = @current_eatery.reviews.build
      #@review = Review.new
      #@eatery = Eatery.find(params[:eatery_id])
    end

    def create
      #@eatery = Eatery.find(params[:eatery_id])
      #@review = Review.new(review_params)
      #if @review.save
      #  redirect_to reviews_path
      #else
      #  render 'new'
      #end
      @review = @current_eatery.reviews.build(review_params)
      #if @review = @eatery.reviews.create(review_params)
      if @review.save
        redirect_to reviews_path
      else
        "new"
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
    def set_review
      @review = @current_eatery.reviews.find(params[:id])
    end

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
        :visited,
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
        :image_11,
        :image_12,
        :image_13,
        :image_14,
        :image_15,
        :image_16,
        :image_17,
        :image_18,
        :image_19,
        :image_20,
        :image_21,
        :image_22,
        :image_23,
        :image_24,
        :image_25,
        :image_26,
        :image_27,
        :image_28,
        :image_29,
        :image_30,
        )
    end
end
