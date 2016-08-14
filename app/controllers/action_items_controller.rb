class ActionItemsController < ApplicationController
  def new
    @action_item = ActionItem.new(meeting_id: params['meeting'], note_id: params['note'])
  end

  def create
    aip = action_item_params
    ap aip
    @ai = ActionItem.new(aip)
    ap @ai
    if @ai.save!
      flash[:success] = 'Action Item Created!'
      redirect_to meeting_path(aip[:meeting_id])
    else
      render 'new'
    end
  end

  def show
    @action_item = ActionItem.find(params[:id])
  end

  def index
    @action_items = ActionItem.paginate(page: params[:page])
  end

  def edit
    @note = ActionItem.find(params[:id])
  end

  def destroy
    ActionItem.find(params[:id]).destroy
    flash[:success] = "note destroyed."
    redirect_to action_items_url
  end

  private

  def action_item_params
    params.require(:action_item).permit(:assigned_to, :title, :body, :action_type, :meeting_id, :note_id)
  end
end
