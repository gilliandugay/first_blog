class Article < ActiveRecord::Base
  STATUSES = %w(Draft Posted)

  belongs_to :author
  has_many :comments, :dependent => :destroy

  validates_presence_of :title, :message => 'required'
  validates_presence_of :body, :message => 'required'
  validates_presence_of :author, :message => 'required'
  validates_inclusion_of :status, :in => STATUSES

  before_save :set_date_posted


  named_scope :recent, lambda { |limit|
     { :order => 'date_posted DESC',
      :limit => limit }
  }
  named_scope :posts, :conditions => {:status => 'Posted'}
  named_scope :drafts, :conditions => {:status => 'Draft'}
  named_scope :by_author, lambda { |author|
    case author
    when Author
      author_id = author.id
    when Integer, String
      author_id = author.to_i
    end
    { :conditions => {:author_id => author_id} }
  }

  def self.statuses
    STATUSES
  end

  def posted?
    status.eql? "Posted"
  end

  private
  def set_date_posted
    self.date_posted = DateTime.now if posted?
  end
end