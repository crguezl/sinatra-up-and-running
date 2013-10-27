desc "run server"
task :default => %w{config.ru} do #  modular_application1.rb
  sh "rackup -Ilib -s thin -p 4567"
end

