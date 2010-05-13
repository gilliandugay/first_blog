class CommentsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id]) 
    render :template => "articles/latest"
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.comment_date = DateTime.now

    if @comment.save
      flash[:notice] = "Comment was successfuly posted."
      render :partial => 'comments/box',
          :locals => {:comment => @comment} unless @comment.new_record?
    else
      flash[:notice] = "Failed to post comment."
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end
end
