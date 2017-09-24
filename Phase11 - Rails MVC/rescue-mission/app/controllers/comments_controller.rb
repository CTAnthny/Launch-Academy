class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(comment_params)

    if @comment.save
      flash[:notice] = "Your answer was successfully posted!"
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
