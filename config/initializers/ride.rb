# config/initializers/redis.rb

# Carregue a biblioteca Redis
require 'redis'

# Crie uma nova instância do cliente Redis
redis = Redis.new(url: 'rediss://red-cp4egei1hbls73f0gic0:XdtJb5cUIw2kQHtb0Hre6BlGutklcUC4@oregon-redis.render.com:6379', password: 'XdtJb5cUIw2kQHtb0Hre6BlGutklcUC4')
puts redis.ping
