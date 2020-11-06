class ItemsController < ApplicationController
  before_action :configure_permitted_parametes

  def index
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
