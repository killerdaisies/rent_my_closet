class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :sizing, :category, :availability)
  end


  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
