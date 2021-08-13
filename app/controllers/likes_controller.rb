class LikesController < ApplicationController
  before_action :report_params

  def create
    Like.create(user_id: current_user.id, report_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, report_id: params[:id]).destroy
  end

  private
  def report_params
    @report = Report.find(params[:id])
  end

end
