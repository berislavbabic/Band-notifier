class Notifier < ActionMailer::Base
  default :from => "berislav@infolink.hr"
  def event_notify(member, event)
    @event = event
    mail(:to => member.email, :subject => event.name)
  end
end
