class BasePolicy
  attr_reader :user

  def initialize(user, post)
    @user = user
  end

  def update?
    user.admin?
  end
end
