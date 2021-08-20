class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "投稿しました！"
      redirect_to question_path(@question.id)
    else
      @question = Question.new
      flash[:alert] = "質問投稿に失敗しました！"
      render 'new'
    end

  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
    if @question.user_id == current_user.id
    else
      redirect_to questions_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "編集しました"
      redirect_to question_path(@question.id)
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :question_image)
  end

end
