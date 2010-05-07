module AuthorsHelper
  def author_panel(author)
    panel = %Q{
      <div class='author-panel'>
        <p>
          <span class='label'>Name</span>
          #{format_name author}
        </p>
        <p>
          <span class='label'>Birthday</span>
          #{(format_date author.birthday) unless author.birthday.nil?}
        </p>
        <p>
          #{display_article_list(Article.posts.by_author(author))}
        </p>
        <p class='controls'>
          #{link_to 'Show', author}
      }
    
    panel << %Q{
          | #{link_to 'Edit', edit_author_path(author)}
          | #{link_to 'Delete', author,
            :confirm => 'Are you sure you want to delete this author?',
            :method => :delete}
          } if author.eql? current_author
    
    panel << "</p></div>"

    return panel
  end

  private
  def display_article_list(articles)
    case articles.size
      when 0
        'No articles yet.'
      when 1
        %Q{ <span class='label'>Articles</span>
            #{articles.first.title} }
      else
        %Q{ <span class='label'>Articles</span>
            #{articles.collect{ |article| article.title } * ", " } }
    end
  end
end