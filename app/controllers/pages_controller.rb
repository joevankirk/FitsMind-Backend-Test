class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to user_chats_path(user_id: current_user.id)
    end
  end
end
