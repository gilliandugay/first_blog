# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def menu
  end

  def format_date(date, options={})
    {:short_date => false, :with_time => false}.merge!(options)

    formatted = date.strftime(options[:short_date] ? '%m/%d/%Y' : '%B %d, %Y')
    formatted << date.strftime(', %H:%M:%S') if options[:with_time]

    return formatted
  end

  def format_name(author, options={})
    {:initial_first => false, :last_name_first => false}.merge!(options)

    first_name =
      (options[:initial_first] ? "#{author.first_name[0].chr}." : author.first_name)
    last_name = author.last_name

    if options[:last_name_first]
      "#{last_name}, #{first_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
