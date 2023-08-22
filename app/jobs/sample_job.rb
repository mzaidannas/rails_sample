class SampleJob
  prepend ApplicationJob
  queue_as :default

  def perform(user_name)
    user = Source.find_by(name: user_name)
    return nil if user.nil?
    logger.debug "User: #{user.name}"
    nil
  end
end
