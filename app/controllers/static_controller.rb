class StaticController < ApplicationController
    skip_before_action :require_login, only: [:index]

end
