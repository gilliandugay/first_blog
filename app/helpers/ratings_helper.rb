module RatingsHelper
  def display_rating_panel(article)
    response = ""

    num_likers = article.ratings.positive.count

    liked_by_current =
      article.ratings.positive.exists?( :author_id  => current_author.id )
    disliked_by_current =
      article.ratings.negative.exists?( :author_id  => current_author.id )

    article_rating_url_params = { :controller => :ratings,
      :article_id => article.id }

    if liked_by_current
      response << image_tag("rating_like.png")
      response << link_to_remote(image_tag("rating_not_dislike.png"), :update => "rating-panel",
        :url => article_rating_url_params.merge(:action => "like"), :method => :put)
    elsif disliked_by_current
      response << link_to_remote(image_tag("rating_not_like.png"), :update => "rating-panel",
        :url => article_rating_url_params.merge(:action => "dislike"), :method => :put)
      response << image_tag("rating_dislike.png")
    else
      response << link_to_remote(image_tag("rating_like.png"), :update => "rating-panel",
        :url => article_rating_url_params.merge(:action => "like"))
      response << link_to_remote(image_tag("rating_dislike.png"), :update => "rating-panel",
        :url => article_rating_url_params.merge(:action => "dislike"))
    end

    if liked_by_current
      response << %Q{You #{num_likers == 1 ? "<b>like</b> this. " : "and "} }
      response << "#{pluralize(num_likers - 1, 'other person')} " +
        "#{num_likers > 1 ? '<b>like</b>' : '<b>likes</b>'} this. " unless num_likers == 1
    elsif disliked_by_current
      response << "You <b>hate</b> this. "
    end

    return response
  end
end
