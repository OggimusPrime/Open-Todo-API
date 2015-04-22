class Api::ItemsController < ApiController
  before_action :authenticated?
  
  def create
    item = Item.new(params.require(:item).permit(:description))

    if item.save
      render json: item #, status: 201, location: list
    end
  end
end