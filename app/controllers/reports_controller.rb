class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      flash[:notice] = "投稿しました！"
      redirect_to report_path(@report.id)
    else
      @reports = Report.new
      flash[:alert] = "投稿に失敗しました！"
      render 'new'
    end

  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
    if @report.user_id == current_user.id
    else
      redirect_to reports_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "編集しました"
      redirect_to report_path(@report.id)
    else
      render 'edit'
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path
  end

  def search
    if params[:keyword].present?
      @reports = Report.where('title LIKE ? OR body LIKE ?', "%#{params[:keyword]}%" , "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @reports = Report.all
    end
  end

  def rank
    @all_ranks = Report.create_all_ranks
  end

  private

  def report_params
    params.require(:report).permit(:title, :body, :user_id, :report_image)
  end

end
