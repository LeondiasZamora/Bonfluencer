class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :content
      t.string :author_image_url
      t.boolean :confirmed

      t.timestamps
    end
  end
end
