class Report < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  attachment :report_image

  def self.create_all_ranks
    Report.find(Like.group(:report_id).order('count(report_id) desc').limit(10).pluck(:report_id))
  end

end
