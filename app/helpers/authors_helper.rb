module AuthorsHelper
  def author_panel(author)
    table =  %Q{
      <table class='author_panel' cellspacing='0'>
        <tr>
          <th>Name</th>
          <td>#{author.full_name}</td>
        </tr><tr>
          <th>Birthday</th>
          <td>#{author.full_birthday}</td>
        </tr><tr>
          <th>Articles</th>
    }

    if author.articles.size > 0
      table << "<td><ol>"

      for article in author.articles do
        table << "<li>#{article.title}</li>"
      end

      table << "</ol></td>"
    else
      table << "<td>None</td>"
    end

    table << %Q{
      </tr><tr>
        <td id='controls' colspan='2'>
          #{link_to 'Show', author}
          #{link_to 'Edit', edit_author_path(author)}
          #{link_to 'Delete', author, :confirm => 'Are you sure you want to delete this author?', :method => :delete}
        </td>
      </tr>
    </table>
    }

    table
  end
end
