# Ruby casbin RabbitMQ watcher

Casbin role watcher to be used for monitoring updates to casbin policies

### Installation
```
gem 'casbin-ruby'
gem 'casbin-ruby-rabbitmq-watcher'
```

### Basic Usage
```ruby
require 'casbin-ruby'
require 'casbin-ruby-rabbitmq-watcher'

enforcer = Casbin::Enforcer.new("path/to/model.conf", "path/to/policy.csv")
conn = Bunny.new
channel = conn.create_channel
watcher = CasbinWatcher::Rabbitmq.new(channel)
watcher.set_update_callback(enforcer.e.load_policy)
enforcer.watcher = watcher

```
