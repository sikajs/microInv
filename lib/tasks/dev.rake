namespace :dev do
  desc "Rebuild the system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:schema:load", "db:migrate"]
end
