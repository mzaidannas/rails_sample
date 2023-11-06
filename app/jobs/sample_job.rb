class SampleJob
  prepend ApplicationJob
  queue_as :default

  def perform(user_email)
    user = User.find_by(email: user_email)
    return nil if user.nil?
    logger.debug "User: #{user.email}"
    nil
  end
end
