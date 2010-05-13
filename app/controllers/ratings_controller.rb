class RatingsController < ApplicationController
  def like
    @rating = Rating.new(
      :article => Article.find(params[:article_id]),
      :author  => current_author,
      :liked   => true)
    @rating.save

    render :partial => 'ratings/form',
        :locals => {:rating => @rating, :article => @rating.article}
  end

  def dislike
    @rating = Rating.new(
      :article => Article.find(params[:article_id]),
      :author  => current_author,
      :liked   => false)
    @rating.save

    render :partial => 'ratings/form',
        :locals => {:rating => @rating, :article => @rating.article}
  end

  def update
    @rating = Rating.find(
      :last, :conditions => { :article_id => params[:article_id],
                              :author_id => current_author.id } )
    @rating.liked = !@rating.liked
    @rating.save

    render :partial => 'ratings/form',
        :locals => {:rating => @rating, :article => Article.find(params[:article_id])}
  end

  def destroy
    @article = Article.find(params[:article_id])
    @rating = Rating.find(:last, :conditions => {:article_id => params[:article_id], :author_id => current_author.id})
    @rating.destroy

    render :partial => 'ratings/form',
        :locals => {:rating => nil, :article => @article}
  end
end
