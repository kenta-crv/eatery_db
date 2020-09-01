class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.references :admin, foreign_key: true
      t.string :title #タイトル
      t.string :file #ファイル
      t.string :choice #選択
      t.string :keyword #キーワード
      t.string :description #説明
      t.text :body #本文
      t.timestamps
    end
  end
end
