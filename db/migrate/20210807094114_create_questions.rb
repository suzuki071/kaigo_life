class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.string :question_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
