class Comment < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :email, :message => 'required'
  validates_presence_of :body, :message => 'required'
  validates_format_of   :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def comment_date_f
    (comment_date.nil?) ? '' : comment_date.strftime('%d %B %Y, %H:%M:%S')
  end
end