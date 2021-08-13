class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :body
      t.string :report_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
