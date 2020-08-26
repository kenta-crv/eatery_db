class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :eatery, foreign_key: true
      t.references :user, foreign_key: true
      t.string :delicious_score #美味しさ
      t.string :mood_score #ムードスコア
      t.string :cost_performance_score #コストパフォーマンススコア
      t.string :service_score #サービススコア
      t.string :imagination_score #イマジネーションスコア
      t.string :original1 #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
      t.string :original1_score #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
      t.string :original2 #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
      t.string :original2_score #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
      t.string :revisit #再訪したいレベルか？
      t.string :average_price #平均金額
      t.string :title #タイトル
      t.string :keyword #キーワード
      t.string :description #説明
      t.date :visited #訪問日
      t.text :body #本文
      t.string :image_1 #本文
      t.string :image_2 #本文
      t.string :image_3 #本文
      t.string :image_4 #本文
      t.string :image_5 #本文
      t.string :image_6 #本文
      t.string :image_7 #本文
      t.string :image_8 #本文
      t.string :image_9 #本文
      t.string :image_10 #本文
      t.timestamps
    end
  end
end
