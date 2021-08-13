class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = current_user.answers.new(answer_params)
    answer.question_id = question.id
    answer.save
    redirect_to question_path(question)
  end

  def destroy
    Answer.find_by(question_id: params[:question_id], id: params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
