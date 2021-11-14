class Report < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  attachment :report_image

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  def self.create_all_ranks
    Report.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

end
