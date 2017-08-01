namespace :slack do
  desc 'Notify slack start of deployment'
  task :deploy_start do
    set :time_started, Time.now.to_i
    fetch(:slack_client).ping '', attachments: [{
      fallback: "#{fetch(:slack_user)} starting a deploy. Stage: #{fetch(:stage)} "\
        "Revision/Branch: #{fetch(:current_revision, fetch(:branch))} "\
        "App: #{fetch(:application)}",
      title: "Deployment Starting",
      color: "#F35A00",
      fields: [
        {
          title: "User",
          value: "#{fetch(:slack_user)}",
          short: true
        },
        {
          title: "Stage",
          value: "#{fetch(:stage)}",
          short: true
        },
        {
          title: "Revision/Branch",
          value: "#{fetch(:current_revision, fetch(:branch))}",
          short: true
        },
        {
          title: "Application",
          value: "#{fetch(:application)}",
          short: true
        }
      ]
    }]
  end

  desc 'Notify slack completion of deployment'
  task :deploy_complete do
    set :time_finished, Time.now.to_i
    elapsed = Integer(fetch(:time_finished) - fetch(:time_started))
    fetch(:slack_client).ping '', attachments: [{
      fallback: "Revision #{fetch(:current_revision, fetch(:branch))} of "\
        "#{fetch(:application)} deployed to #{fetch(:stage)} by #{fetch(:slack_user)} "\
        "in #{elapsed} seconds.",
      title: 'Deployment Complete',
      color: "#7CD197",
      fields: [
        {
          title: "User",
          value: "#{fetch(:slack_user)}",
          short: true
        },
        {
          title: "Stage",
          value: "#{fetch(:stage)}",
          short: true
        },
        {
          title: "Revision/Branch",
          value: "#{fetch(:current_revision, fetch(:branch))}",
          short: true
        },
        {
          title: "Application",
          value: "#{fetch(:application)}",
          short: true
        },
        {
          title: "Duration",
          value: "#{elapsed} seconds",
          short: true
        }
      ]
    }]
  end

  desc 'Notify slack of a failure in deployment'
  task :deploy_failed do
    fetch(:slack_client).ping "Deploy Failed!", attachments: [{
      fallback: "#{fetch(:stage)} deploy of #{fetch(:application)} "\
        "with revision/branch #{fetch(:current_revision, fetch(:branch))} failed",
      title: "Deployment Failed",
      text: "#{fetch(:stage)} deploy of #{fetch(:application)} "\
        "with revision/branch #{fetch(:current_revision, fetch(:branch))} failed",
      color: "#FF0000",
      fields: [
        {
          title: "User",
          value: "#{fetch(:slack_user)}",
          short: true
        },
        {
          title: "Stage",
          value: "#{fetch(:stage)}",
          short: true
        },
        {
          title: "Revision/Branch",
          value: "#{fetch(:current_revision, fetch(:branch))}",
          short: true
        },
        {
          title: "Application",
          value: "#{fetch(:application)}",
          short: true
        }
      ]
    }]
  end

  desc 'Notify slack of Rails Cache clearing'
  task :rails_cache_cleared do
    fetch(:slack_client).ping '', attachments: [{
      fallback: "Rails cache cleared on #{fetch(:stage)}",
      text: "Rails cache cleared on #{fetch(:stage)}",
      color: "#7CD197"
    }]
  end
end
