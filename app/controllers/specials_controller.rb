class SpecialsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :before_search
    def index
      @specials = Special.order(created_at: "DESC").page(params[:page])
    end

    def show
      @special = Special.find(params[:id])
    end

    def new
      @special = Special.new
    end

    def create
      @special = Special.new(special_params)
      if @special.save
        redirect_to specials_path
      else
        render 'new'
      end
    end

    def edit
      @special = Special.find(params[:id])
    end

    def destroy
      @special = Special.find(params[:id])
      @special.destroy
       redirect_to specials_path
    end

    def update
      @special = Special.find(params[:id])
      if @special.update(special_params)
        redirect_to specials_path
      else
        render 'edit'
      end
    end

    private
    def special_params
      params.require(:special).permit(
        :title, #タイトル
        :file,  #写真
        :choice,  #カテゴリー
        :keyword, #キーワード
        :description, #説明
        :body #本文
        )
    end
end
