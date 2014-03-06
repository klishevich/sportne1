class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :mark
      t.string :description
      t.references :video
      t.references :user

      t.timestamps
    end
    add_index :works, :video_id
    add_index :works, :user_id
  end
end
