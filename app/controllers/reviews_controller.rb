class ReviewsController < ApplicationController
    before_action :set_eatery
    before_action :set_user
    #before_action :set_review, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
      #@reviews = Review.all
      @reviews = Review.published.order("created_at DESC").page(params[:page]).per(30)
    end

    def show
      @eatery = Eatery.find(params[:eatery_id])
      @review = Review.find_by(id: params[:id], eatery_id: @eatery.id)
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

    def review_import
      cnt = Review.review_import(params[:review_file])
      redirect_to reviews_url, notice:"#{cnt}件登録されました。"
    end

    def confirm
      @reviews = Review.draft.order("created_at DESC")
    end

    private
    #def set_review
  #    @review = @current_eatery.reviews.find(id: params[:id])
  #  end

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
        :status,
        :image_1, #ファイル
        {image_2: []}
        )
    end
end
