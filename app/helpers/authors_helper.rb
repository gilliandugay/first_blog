module AuthorsHelper
  def author_panel(author)
    panel = %Q{
      <div class='author-panel'>
        <p>
          <span class='label'>Name</span>
          #{author.full_name}
        </p>
        <p>
          <span class='label'>Birthday</span>
          #{author.full_birthday}
        </p>
        <p>
      }

    case author.articles.size
      when 0
        panel << "No articles yet."
      when 1
        panel << author.articles.first.title
      else
        panel << author.articles.collect{ |article| article.title if article.posted? } * ", "
    end

    panel << %Q{
        </p>
        <p class='controls'>
          #{link_to 'Show', author}
      }
    
    panel << %Q{
          #{link_to 'Edit', edit_author_path(author)}
          #{link_to 'Delete', author, :confirm => 'Are you sure you want to delete this author?', :method => :delete}
      } if author.eql? current_author
    
    panel << "</p></div>"

    return panel
  end
end
