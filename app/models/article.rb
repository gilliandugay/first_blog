class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  validates_presence_of :title, :message => "required"
  validates_presence_of :body, :message => "required"
  validates_presence_of :author, :message => "required"

  def abbreviated_date_posted
    (status.eql?("Posted") ? date_posted.strftime("%b %d %Y") : "")
  end

  def full_date_posted
    (status.eql?("Posted") ? date_posted.strftime("%d %B %Y") : "")
  end

  def author_name
    "#{author.last_name}, #{author.first_name}"
  end

  def self.statuses
    %w(Draft Posted)
  end

  def posted?
    status.eql? "Posted"
  end

  validates_inclusion_of :status, :in => Article.statuses

  def before_save
    date_posted = DateTime.now if posted?
  end

  def self.latest
    Article.find_by_status("Posted", :order => "date_posted desc")
  end

  def self.recent_posts
    Article.find(:all, :conditions => "status LIKE 'Posted'", :order => "date_posted desc", :limit => 10)
  end
end
