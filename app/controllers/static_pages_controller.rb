class StaticPagesController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :prefecture, :city).order(created_at: :desc).limit(15)
    @questions = Question.all.includes(:user, :area).order(created_at: :desc)
    @question_pickups = Question.includes(:area).order('RAND()').limit(1)
  end

  def about
  end

  def cancel_membership
  end

  def destroy_user
    current_user.destroy
    redirect_to root_path, notice: t('devise.registrations.destroyed'), status: :see_other
  end

  def privacy_policy
  end

  def terms
  end
end
