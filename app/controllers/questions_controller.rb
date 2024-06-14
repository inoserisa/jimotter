class QuestionsController < ApplicationController
  def index
    @questions = Question.all.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: "質問が投稿されました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user, :prefecture, :city).order(created_at: :desc)
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy!
    redirect_to root_path, status: :see_other, notice: t('.success')
  end

  private

  def question_params
    params.require(:question).permit(:content, :prefecture_id, :city_id)
  end
end
