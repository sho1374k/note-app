class NotesController < ApplicationController

  def index
    @note = Note.all
  end

  def new
    @notes = Note.new
  end

  def create
    @notes = Note.create(note_params)
    if @notes.save
      render :create
    else
      render :new
    end
  end

  def destroy
    note = Note.find(params[:id])
    if note.destroy
      render :destroy
    else
      render :index
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render :update
    else
      render :edit
    end
  end

  private
  def note_params
    params.require(:note).permit(:content)
  end

end
