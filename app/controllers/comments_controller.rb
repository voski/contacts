class CommentsController < ApplicationController

  def index
    @commentable = find_commentable
    @comments = @commentable.comments

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comments.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy

  end

  

  private

    def comment_params
      params[:comment].permit(:body, :commentable_id, :commentable_type)
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
