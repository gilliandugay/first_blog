module SessionsHelper
  def logged_in?
    not current_author.nil?
  end
end
