class Author < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  has_many :ratings, :through => :articles

  acts_as_authentic
  
  validates_presence_of   :last_name, :message => 'required'
  validates_presence_of   :first_name, :message => 'required'
  validates_presence_of   :login, :message => 'required'
  validates_presence_of   :email, :message => 'required'
  validates_presence_of   :password, :message => 'required'
  validates_presence_of   :password_confirmation, :message => 'required'
  validates_uniqueness_of :login, :message => 'already taken. Choose another login name.'
end
