class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  devise_group :user, contains: [:customer, :trainer]
end
