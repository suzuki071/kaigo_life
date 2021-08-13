class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :body
      t.string :answer_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
