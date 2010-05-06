module CommentsHelper
  def comment_box(comment)
    html = %Q{
      <div class="comment">
        <h4>#{comment.email}</h4>
        <h5>#{comment.comment_date_f}</h5>
        <p>#{comment.body}</p>
    }
    html << %Q{
        <p>
          #{link_to 'Delete', article_comment_path(comment.article, comment), :confirm => 'Are you sure you want to delete this article?'}
        </p>
      </div>
    } if (comment.email.eql? current_author.email) or (comment.article.author.email.eql? current_author.email)

    html
  end
end
