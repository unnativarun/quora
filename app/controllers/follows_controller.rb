class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question

  def user
  	if current_user.following_ids.include?(@question.user_id)
  		flash[:alert] = "Already following"
  	else
  		current_user.following << @question.user
      flash[:notice] = "Successfully followed"
  	end	
  	redirect_to question_path(@question)
  end

  def topic
  	if current_user.topic_ids.include?(@question.topic_id)
  		flash[:alert] = "Already following"
  	else
  		current_user.topics << @question.topic
      flash[:notice] = "Successfully followed"
  	end	
  	redirect_to question_path(@question)
  end

  private
  def find_question
  	@question = Question.find(params[:question_id])
  end
end
