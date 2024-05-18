Sidekiq.configure_server do |config|
  config.redis = { url: 'rediss://red-cp4egei1hbls73f0gic0:XdtJb5cUIw2kQHtb0Hre6BlGutklcUC4@oregon-redis.render.com:6379' }

  # Verificar se o arquivo de agendamento existe antes de tentar carregá-lo
  schedule_file = "config/schedule.yml"
  if File.exist?(schedule_file)
    Sidekiq::Scheduler.enabled = true
    Sidekiq::Scheduler.dynamic = true
    Sidekiq::Scheduler.reload_schedule!
  else
    puts "Arquivo de agendamento não encontrado em #{schedule_file}. O Sidekiq Scheduler não será ativado."
  end
end
