class PhrasesController < ApplicationController

  respond_to :html, :json

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.all

    respond_with @phrases
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    @phrase = Phrase.find(params[:id])
    respond_with @phrase
  end

  # GET /phrases/new
  # GET /phrases/new.json
  def new
    @phrase = Phrase.new
    respond_with @phrase
  end

  # GET /phrases/1/edit
  def edit
    @phrase = Phrase.find(params[:id])
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = Phrase.new(params[:phrase])
    if @phrase.save
      respond_with @phrase
    else
      respond_with @phrase do |format|
        format.html { render action: "new" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    @phrase = Phrase.find(params[:id])
    if @phrase.update_attributes(params[:phrase])
      respond_with @phrase
    else
      respond_with @phrase do |format|
        format.html { render action: "edit" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url }
      format.json { head :ok }
    end
  end

  def free
    @free=Phrase.where({:occupied=>nil})
    @free_photo=@free[rand(@free.length)-1]
    respond_with @free_photo
  end

  def occupy
    @phrase = Phrase.find(params[:id])
    unless @phrase.occupy?
      @phrase.occupy!
    end
    respond_with @phrase
  end

  def showcase
    @phrases=Phrase.all
    respond_with @phrases
  end


end
