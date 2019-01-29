class Web::ApplicationController < ApplicationController
  include Web::ApplicationControllerConcern

  before_action :authenticate_user!
end
