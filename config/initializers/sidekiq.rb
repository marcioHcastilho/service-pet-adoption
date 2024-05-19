require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { url: 'rediss://red-cp4egei1hbls73f0gic0:XdtJb5cUIw2kQHtb0Hre6BlGutklcUC4@oregon-redis.render.com:6379' }

  schedule_file = "config/schedule.yml"
  if File.exist?(schedule_file)
    Sidekiq::Scheduler.dynamic = true
    Sidekiq::Scheduler.reload_schedule!
    Sidekiq::Scheduler.enabled = true
  else
    puts "Arquivo  #{schedule_file}. O Sidekiq Scheduler."
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'rediss://red-cp4egei1hbls73f0gic0:XdtJb5cUIw2kQHtb0Hre6BlGutklcUC4@oregon-redis.render.com:6379' }
end
