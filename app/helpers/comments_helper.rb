module CommentsHelper
  def comment_box(comment)
    %Q{
      <div class="comment">
        <h4>#{comment.email}</h4>
        <h5>#{format_date comment.comment_date, :short_date => true, :with_time => true}</h5>
        <p>#{comment.body}</p>
      </div>
    }
  end
end
