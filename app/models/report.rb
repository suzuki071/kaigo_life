class Report < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  attachment :report_image

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  def self.create_all_ranks
    Report.find(Like.group(:report_id).order('count(report_id) DESC').limit(10).pluck(:report_id))
  end

end
