class CreateGoodFits < ActiveRecord::Migration
  def change
    create_table :good_fits do |t|
      t.string :season
      t.string :top
      t.string :bottom
      t.string :footwear
      # t.string :outterwear future update
      # t.string :accessories future update
      t.timestamps null: false
      t.integer :user_id
    end
  end
end
