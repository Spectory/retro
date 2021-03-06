class ActionItemsController < ApplicationController
  def new
    note = Note.find(params['note'])
    note.update(meeting_id: params['meeting'])
    @action_item = ActionItem.new(meeting_id: params['meeting'], note_id: params['note'])
  end

  def create
    aip = action_item_params
    @ai = ActionItem.new(aip)
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
    @action_items = ActionItem.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def edit
    @action_item = ActionItem.find(params[:id])
  end

  def update
    @action_item = ActionItem.find(params[:id])
    if @action_item.update_attributes!(action_item_params)
      flash[:success] = 'Action item updated'
      redirect_to action_items_path
    else
      render 'edit'
    end
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
