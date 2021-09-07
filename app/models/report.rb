class Report < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  attachment :report_image

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  def self.create_all_ranks
    Report.find(Like.group(:report_id).order('count(report_id) DESC').limit(10).pluck(:report_id))
  end

end
