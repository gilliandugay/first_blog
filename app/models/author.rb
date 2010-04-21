class Author < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  validates_presence_of :last_name, :message => "required."
  validates_presence_of :first_name, :message => "required."
  validates_presence_of :login, :message => "required."
  validates_presence_of :email, :message => "required."
  validates_presence_of :password, :message => "required."
  validates_presence_of :password_confirmation, :message => "required."

  validates_uniqueness_of :login, :message => "already taken. Choose another login name."

  acts_as_authentic

  def initial_and_last_name
    "#{first_name[0].chr}. #{last_name}"
  end 

  def full_name
    "#{last_name}, #{first_name}"
  end

  def full_birthday
    birthday.strftime("%B %d, %Y")
  end
end
