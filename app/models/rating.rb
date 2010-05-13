class Rating < ActiveRecord::Base
  belongs_to :author
  belongs_to :article

  named_scope :positive, :conditions => {:liked => true}
  named_scope :negative, :conditions => {:liked => false}
end
