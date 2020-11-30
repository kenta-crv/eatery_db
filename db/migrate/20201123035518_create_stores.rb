class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :store #店舗名
      t.string :store_kana #テンポメイ
      t.string :owner_first_name #オーナー
      t.string :owner_last_name #オーナー
      t.string :first_name #担当者
      t.string :last_name #担当者
      t.string :tel_front
      t.string :tel_middle
      t.string :tel_back
      t.string :fax_front
      t.string :fax_middle
      t.string :fax_back
      #t.string :email #メールアドレス
      t.string :url #URL
      t.string :postnumber #郵便番号
      t.string :prefecture #都道府県
      t.string :city #市区町村
      t.string :town #URL
      t.string :building #ビル名
      t.string :people #人数
      t.string :sales #年間売上

      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.timestamps
    end
  end
end
