module SlackNotifier
  CLIENT = Slack::Notifier.new(
    Rails.application.credentials.slack[:token], 
    channel: "#geral"
  )
end