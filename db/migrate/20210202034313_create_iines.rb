class CreateIines < ActiveRecord::Migration[6.0]
  def change
    create_table :iines do |t|
      t.references :article, foreign_key: true, null: false
      t.references :user,    foreign_key: true, null: false
      t.timestamps
    end
  end
end
