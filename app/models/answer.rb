class Answer < ApplicationRecord
  
  belongs_to :question
  belongs_to :user
  # attachment :image
  
end
