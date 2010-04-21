class CommentsController < ApplicationController
  def index
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id]) 
    render :template => "articles/latest"
  end

  def new
    @comment = Comment.new
  end

  def edit
    @command = Comment.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.comment_date = DateTime.now

    if @comment.save
      flash[:notice] = "Comment was successfuly posted."
      redirect_to article_path(@article)
    else
      flash[:notice] = "Failed to post comment."
      render :template => "articles/latest"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end
end
