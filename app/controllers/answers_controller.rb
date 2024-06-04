class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:prefecture_id, :city_id, :content)
  end
end