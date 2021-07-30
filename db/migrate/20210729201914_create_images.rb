class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.string :title
      t.string :image_path

      t.timestamps
    end
  end
end
