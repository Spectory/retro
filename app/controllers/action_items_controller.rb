class ActionItemsController < ApplicationController
  def new
    @action_item = ActionItem.new(meeting_id: params['meeting'])
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

  private

  def action_item_params
    params.require(:action_item).permit(:assigned_to, :title, :body, :meeting_id)
  end
end
