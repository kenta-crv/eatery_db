class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :search, foreign_key: true
      t.string :damage #被害額
      t.string :message #事前キャンセル料がかかることを伝えているか？
      t.string :request #キャンセル保証申請
      t.string :before #予約時の対応
      t.string :after #予約後の対応
      t.string :remark #備考
      t.timestamps
    end
  end
end
