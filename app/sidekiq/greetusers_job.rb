class GreetusersJob
  include Sidekiq::Job
  
  queue_as :high_priority

  def perform(*args)
    @users = User.all
    @users.each do |user|
      LinkedinMailer.greetings(user).deliver_now
    end
  end
end
