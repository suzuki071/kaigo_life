class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  attachment :question_image
  
  #バリデーション
  validates :body, presence: true

end
