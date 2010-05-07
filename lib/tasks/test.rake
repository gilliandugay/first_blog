desc "echo"
task :echo do
  puts 'test ajejejeje'
end

task :sanitize_email => :environment do
  Author.all.each do |u|
    u.email = u.email + ' ok'
   #u.save
  end
end

task :show_users => [:environment, :sanitize_email] do
  Author.all.map{|u| puts u.email}
end

#test :show_user[:user_id]
