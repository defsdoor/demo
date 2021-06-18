#!/usr/bin/env puma

directory '/var/www/pigw'
rackup "/var/www/pigw/config.ru"
environment 'production'

pidfile "/var/www/pigw/tmp/pids/puma.pid"
state_path "/var/www/pigw/tmp/pids/puma.state"
stdout_redirect '/var/www/pigw/log/puma_access.log', '/var/www/pigw/log/puma_error.log', true


threads 0,16

bind 'unix:///var/www/pigw/tmp/sockets/puma.sock'

workers 0



prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/var/www/pigw/Gemfile"
end

