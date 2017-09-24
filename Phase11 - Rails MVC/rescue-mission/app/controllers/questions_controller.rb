class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @comments = @question.comments.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Your question has been posted!'
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:notice] = 'Your question has been updated!'
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.comments.destroy
    @question.destroy
    flash[:notice] = 'Question has been deleted!'
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
