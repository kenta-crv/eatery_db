class Review < ApplicationRecord
  #belongs_to :eatery
  #belongs_to :user
  mount_uploader :image_1, FilesUploader
  mount_uploader :image_2, FilesUploader
  mount_uploader :image_3, FilesUploader
  mount_uploader :image_4, FilesUploader
  mount_uploader :image_5, FilesUploader
  mount_uploader :image_6, FilesUploader
  mount_uploader :image_7, FilesUploader
  mount_uploader :image_8, FilesUploader
  mount_uploader :image_9, FilesUploader
  mount_uploader :image_10, FilesUploader

  def  self.import(file)
    save_cnt = 0
    CSV.foreach(file.path, headers: true) do |row|
      review = Review.find_by(id: row["id"]) || new
      eatery = Eatery.find_by(tel: row["tel"])
      review.attributes = row.to_hash.slice(*review_attributes)
      review.eatery_id = eatery&.id
      review.save!
      save_cnt += 1
    end
    save_cnt
  end

  def self.review_attributes
    [
    "delicious_score", #美味しさ
    "mood_score", #ムードスコア
    "cost_performance_score", #コストパフォーマンススコア
    "service_score", #サービススコア
    "imagination_score", #イマジネーションスコア
    "original1",
    "original1_score", #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
    "original22",
    "original2_score", #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
    "revisit", #再訪したいレベルか？
    "average_price", #平均金額
    "title", #タイトル
    "keyword", #キーワード
    "description", #説明
    "body",
    "visited"]
  end

end
