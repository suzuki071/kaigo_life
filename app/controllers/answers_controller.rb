class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    question = Question.find(params[:question_id])
    answer = current_user.answers.new(answer_params)
    answer.question_id = question.id
    if answer.save
      flash[:notice] = "回答しました！"
      redirect_to question_path(question)
    else
      @question = Question.find(params[:question_id])
      @answer = Answer.new
      flash[:alert] = "回答に失敗しました！"
      render ("questions/show")
    end
  end

  def destroy
    Answer.find_by(question_id: params[:question_id], id: params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :answer_image)
  end

end
