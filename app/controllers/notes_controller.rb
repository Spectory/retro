class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    np = note_params
    ap np
    @note = Note.new(note_params)
    if @note.save!
      flash[:success] = 'Note Created!'
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def index
    @notes = Note.paginate(page: params[:page])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes!(note_params)
      flash[:success] = "note updated"
      redirect_to notes_path
    else
      render 'edit'
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    flash[:success] = "note destroyed."
    redirect_to notes_url
  end

  private

  def note_params
    params.require(:note).permit(:note_type, :create_by, :title, :body)
  end
end
