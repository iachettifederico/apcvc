class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /essays
  # GET /essays.json
  def index
    @essays = Essay.all
  end

  # GET /essays/1
  # GET /essays/1.json
  def show
  end

  # GET /essays/new
  def new
    @essay = Essay.new
  end

  # GET /essays/1/edit
  def edit
  end

  # POST /essays
  # POST /essays.json
  def create
    @essay = Essay.new(essay_params)
    @essay.authors = params["authors"].map { |attrs| Author.new(attrs) }

    respond_to do |format|
      if @essay.save
        format.html { redirect_to pages_tramas_path, notice: 'Essay was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @essay.authors = params["authors"].map { |attrs| Author.new(attrs) }
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to pages_tramas_path, notice: 'Essay was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to essays_url }
      format.json { head :no_content }
    end
  end

  def document
    essay = Essay.find(params[:essay_id])
    respond_to do |format|
      format.pdf do
        if essay.document_file
          pdf = essay.document_file
          send_data( pdf,
                     filename: "#{essay.id}.pdf",
                     type:     "application/pdf")
        end
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_essay
    @essay = Essay.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def essay_params
    params.require(:essay).permit(:title, :document, :authors, :abstract)
  end

end
