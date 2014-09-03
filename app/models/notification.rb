require 'twilio-ruby'
require_relative "../../credentials"

class Notification
  attr_accessor :to_number

  def initialize(options={})
    @to_number = options[:to_number]
    account_sid = Credentials.credentials[:twilio_account_sid]
    auth_token = Credentials.credentials[:twilio_account_token]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    from = "+17039355236" # Your Twilio number
    @client.account.messages.create(
      :from => from,
      :to => @to_number,
      :body => random_compliment
    )
  end

  def random_compliment
    compliments = ["You got this!", "Never give up, never surrender!", "It could be worse...", "Don't sweat it!"]
    compliments.sample
  end

end