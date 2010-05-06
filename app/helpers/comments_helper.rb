module CommentsHelper
  def comment_box(comment)
    %Q{
      <div class="comment">
        <h4>#{comment.email}</h4>
        <h5>#{comment.comment_date_f}</h5>
        <p>#{comment.body}</p>
      </div>
    }
  end
end
