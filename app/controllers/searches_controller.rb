class SearchesController < ApplicationController
    before_action :set_search, only: [:edit, :update, :destroy, :show]
    before_action :authenticate_user!, only: [:search, :show]
    #before_action :authenticate_admin!, expect: [:search, :show]

    def index
      @q =Search.ransack(params[:q])
      @searches = @q.result
      @searches = Kaminari.paginate_array(@searches).page(params[:page]).per(20)
    end

    def show
    end

    def new
      @search = Search.new
    end

    def create
      @search = Search.new(search_params)
      if @search.save
        redirect_to search_path(@search)
      else
        "new"
      end
    end

    def edit
    end

    def destroy
      @search.destroy
      redirect_to searches_path
    end

    def update
      if @search.update(search_params)
        redirect_to searches_path
      else
        render 'edit'
      end
    end

    def search
      @q =Search.ransack(params[:q])
    end

    private
    def set_search
      @search = Search.find_by(id: params[:id])
    end

    def search_params
      params.require(:search).permit(
        :first_name,
        :last_name,
        :tel,
        :number_of_times,
        :cancel
        )
    end
end
