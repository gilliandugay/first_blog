class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of :last_name, :message => "Last name required."
  validates_presence_of :first_name, :message => "First name required."

  def full_name
    "#{last_name}, #{first_name}"
  end
end
