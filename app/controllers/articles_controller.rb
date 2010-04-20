class ArticlesController < ApplicationController
  def latest
    @article = Article.latest
    @comment = Comment.new(:article_id => @article.id)
  end

  def index
    @articles = Article.all
  end

  def print
   @article = Article.find(params[:id])
   @comment = nil
   render :layout => "print"
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
    render :action => "latest"
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

end
