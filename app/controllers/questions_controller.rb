class QuestionsController < ApplicationController
  def index
    @questions = Question.all.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user, :prefecture, :city).order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: t('.success')
    else
      flash.now[:alert] = t('.failed')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question), notice: t('.success')
    else
      flash.now[:alert] = t('failed')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy!
    redirect_to root_path, status: :see_other, notice: t('.success')
  end

  private

  def question_params
    params.require(:question).permit(:content, :prefecture_id, :city_id, :area_id)
  end
end
