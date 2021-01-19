class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title, null: false
      t.text       :memo,  null: false
      t.string     :place, null: false
      t.date       :date , null: false
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
