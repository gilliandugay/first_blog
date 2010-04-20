module AuthorsHelper
  def author_panel(author)
    table = ""
    table << \
      "<table class='author_panel' cellspacing='0'>" +
        "<tr>" +
          "<th>Name</th>" +
          "<td>#{author.last_name}, #{author.first_name}</td>" +
        "</tr><tr>" +
          "<th>Birthday</th>" +
          "<td>#{author.birthday.strftime("%d %B %y")}</td>" +
        "</tr><tr>" +
          "<th>Articles</th>"

    if author.articles.size > 0
      table << "<td><ol>"

      for article in author.articles do
        table << "<li>#{article.title}</li>"
      end

      table << "</ol></td>"
    else
      table << "<td>None</td>"
    end

    table << \
      "</tr><tr class='controls'>" +
        "<td colspan='2'>" +
          "#{link_to "Show", author} " +
          "#{link_to "Edit", edit_author_path(author)} " +
          "#{link_to "Delete", author, :confirm => "Are you sure you want to delete this author?", :method => :delete}" +
        "</td>" +
      "</tr>" +
    "</table>"

    table
  end
end
