class Review < ApplicationRecord
  belongs_to :eatery
  belongs_to :user, optional: true
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
  mount_uploader :image_11, FilesUploader
  mount_uploader :image_12, FilesUploader
  mount_uploader :image_13, FilesUploader
  mount_uploader :image_14, FilesUploader
  mount_uploader :image_15, FilesUploader
  mount_uploader :image_16, FilesUploader
  mount_uploader :image_17, FilesUploader
  mount_uploader :image_18, FilesUploader
  mount_uploader :image_19, FilesUploader
  mount_uploader :image_20, FilesUploader
  mount_uploader :image_21, FilesUploader
  mount_uploader :image_22, FilesUploader
  mount_uploader :image_23, FilesUploader
  mount_uploader :image_24, FilesUploader
  mount_uploader :image_25, FilesUploader
  mount_uploader :image_26, FilesUploader
  mount_uploader :image_27, FilesUploader
  mount_uploader :image_28, FilesUploader
  mount_uploader :image_29, FilesUploader
  mount_uploader :image_30, FilesUploader

  def  self.review_import(review_file)
    save_cnt = 0
    CSV.foreach(review_file.path, headers: true) do |row|
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

  @@ScoreNumbers = [
50,
49,
48,
47,
46,
45,
44,
43,
42,
41,
40,
39,
38,
37,
36,
35,
34,
33,
32,
31,
30,
29,
28,
27,
26,
25,
24,
23,
22,
21,
20,
19,
18,
17,
16,
15,
14,
13,
12,
11,
10,
9,
8,
7,
6,
5,
4,
3,
2,
1,
  ]

  def self.ScoreNumbers
    @@ScoreNumbers
  end

  def self.create_reviews_by(review_params)
    return false if review_params[:image_1].nil?
    Review.transaction do
      review_params[:image_1].each do |review|
        new_review = Review.new(image_1: review)
        return false unless new_review.save!
      end
    end
    true
  end

  enum status: {draft: 0, published: 1}
  #has_one_attached :image
  #has_rich_text :body
end
