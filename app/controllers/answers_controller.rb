class AnswersController < ApplicationController
  before_action :authenticate_user!, only:[:create]

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question = Question.find(params[:question_id])
    if @answer.save
      redirect_to @answer.question, notice: '投稿しました'
    else
      redirect_to @answer.question, alert: '回答に失敗しました'
    end
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
  end

  private

  def answer_params
    params.require(:answer).permit(:prefecture_id, :city_id, :content).merge(question_id: params[:question_id])
  end
end