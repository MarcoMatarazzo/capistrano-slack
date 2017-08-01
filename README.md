Capistrano 3 Slack Integration

## Credits

Based on 

* http://clokwork.net/articles/better-cap-deploy-with-slack/ from @cloksmith
* https://github.com/stevenosloan/slack-notifier

#### Installation

Add it to your Gemfile:

```ruby
gem 'capistrano-slack', github: 'MarcoMatarazzo/capistrano-slack'
```

#### Configuration

Add to your Capfile:

```ruby
require 'slack-notifier'
require 'capistrano-slack'
```

Add to your deploy.rb:

```ruby
set :slack_url, 'https://hooks.slack.com/services/XXX/XXX/XXX'
set :slack_channel, '#capistrano_channel'
set :slack_username, 'Capistrano'
set :slack_icon, 'https://somewhere.com/icon.png'
set :slack_user, `git config --get user.name`.chomp
set :slack_client, Slack::Notifier.new(
  fetch(:slack_url),
  channel: fetch(:slack_channel),
  username: fetch(:slack_username),
  icon_url: fetch(:slack_icon)
)
### CHECKING...
#before 'deploy', 'slack:starting'
#after  'deploy', 'slack:finished'
#before 'deploy:rollback', 'slack:failed'
#after 'deploy:rollback', 'slack:rolled_back'
```
