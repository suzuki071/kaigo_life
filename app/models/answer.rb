class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :user
  attachment :answer_image

end
