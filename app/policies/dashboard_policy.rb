# app/policies/dashboard_policy.rb
class DashboardPolicy
  # `_record` in this example will be :dashboard
  def initialize(user, _record)
    @user = user
  end

  def show?
    user.admin?
  end
end
