class Comment < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :email, :message => 'required'
  validates_presence_of :body, :message => 'required'
  validates_format_of   :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end