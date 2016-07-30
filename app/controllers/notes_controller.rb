class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    np = note_params
    ap np
    @note = Note.new(note_params)
    ap @note
    if @note.save!
      flash[:success] = 'Note Created!'
      redirect_to @note
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

  private

  def note_params
    params.require(:note).permit(:note_type, :create_by, :title, :body)
  end
end
