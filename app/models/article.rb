class Article < ActiveRecord::Base
  STATUSES = %w(Draft Posted)

  belongs_to :author
  has_many :comments, :dependent => :destroy

  validates_presence_of :title, :message => 'required'
  validates_presence_of :body, :message => 'required'
  validates_presence_of :author, :message => 'required'
  validates_inclusion_of :status, :in => STATUSES

  before_save :set_date_posted

  named_scope :recent_posts, lambda { |limit|
    limit ||= 10
    
    { :conditions => {:status => 'Posted'},
      :order      => 'date_posted DESC',
      :limit      => limit }
  }

  def self.statuses
    STATUSES
  end

  def author_name
    "#{author.last_name}, #{author.first_name}"
  end

  def posted?
    status.eql? "Posted"
  end

  private
  def set_date_posted
    date_posted = DateTime.now if posted?
  end
end