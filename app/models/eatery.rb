class Eatery < ApplicationRecord
  mount_uploader :image_1, ImagesUploader
  mount_uploader :image_2, ImagesUploader
  mount_uploader :image_3, ImagesUploader
  mount_uploader :image_4, ImagesUploader
  mount_uploader :image_5, ImagesUploader
  mount_uploader :image_6, ImagesUploader
  mount_uploader :image_7, ImagesUploader
  mount_uploader :image_8, ImagesUploader
  mount_uploader :image_9, ImagesUploader
  mount_uploader :image_10, ImagesUploader
  has_many :reviews

  #eatery_import
  def self.import(file)
      save_cont = 0
      CSV.foreach(file.path, headers:true) do |row|
       eatery = find_by(id: row["id"]) || new
       eatery.attributes = row.to_hash.slice(*updatable_attributes)
       #next if eatery.industry == nil
       #next if self.where(tel: eatery.tel).where(industry: nil).count > 0
       #next if self.where(tel: eatery.tel).where(industry: eatery.industry).count > 0
       eatery.save!
       save_cont += 1
      end
      save_cont
  end
  def self.updatable_attributes
    [
    "store", #店舗名
    "store_kana",
    "url", #URL
    "tel", #電話番号
    "prefecture",
    "city",
    "town",
    "chome",
    "building",
    "payment", #支払方法
    "genre", #ジャンル
    "payment", #支払方法
    "price_lunch", #ランチ単価
    "price_dinner", #ディナー単価
    "hour", #営業時間
    "holiday", #定休日
    "difficulty", #難易度
    "bookking", #予約方法
    "sit", #席数
    "open", #オープン
    "chef", #シェフ
    "career", #キャリア
    "remarks", #備考
    "takeout",]
  end

  def address
    prefecture + city + town + chome + building
  end
end
