class StoresController < ApplicationController
  #before_action :set_store, only: [:edit, :update, :destroy, :show]
  before_action :set_store
  before_action :set_user
  before_action :authenticate_user!, expect: [:index]
  #before_action :authenticate_admin!, only: [:index]

  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result
    @stores = Kaminari.paginate_array(@stores).page(params[:page]).per(20)
  end

  def show

  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_path(@store)
    else
      "new"
    end
  end

  def edit
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  def update
    if @store.update(store_params)
      redirect_to stores_path
    else
      render 'edit'
    end
  end

  def store
    @q = Store.ransack(params[:q])
  end

  private
  def set_store
    @store = Store.find_by(id: params[:id])
  end

  def store_params
    params.require(:store).permit(
      :store, #店舗名
      :store_kana, #テンポメイ
      :owner_first_name, #オーナー
      :owner_last_name, #オーナー
      :first_name, #担当者
      :last_name, #担当者
      :tel_front,
      :tel_middle,
      :tel_back,
      :fax_front,
      :fax_middle,
      :fax_back,
      #:email, #メールアドレス
      :url, #URL
      :postnumber, #郵便番号
      :prefecture, #都道府県
      :city, #市区町村
      :town, #URL
      :building, #ビル名
      :people, #人数
      :sales, #年間売上

      :postcode,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building
      )
  end
end
