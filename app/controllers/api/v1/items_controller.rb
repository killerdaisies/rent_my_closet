class Api::V1::ItemsController < Api::V1::BaseController
  def index
    @items = Item.all
    if params[:query].present?
      sql_query = " \
        items.name @@ :query \
        OR items.description @@ :query \
        OR users.wechat_name @@ :query \
      "
      @items = Item.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end
end
