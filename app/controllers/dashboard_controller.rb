class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action -> { authorize :dashboard, :show? }
end
