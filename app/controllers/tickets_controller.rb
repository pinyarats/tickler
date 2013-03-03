require 'open-uri'
require 'tesseract'

class TicketsController < ApplicationController
  before_filter :authenticate_user!
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all

    render json: @tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    render json: @ticket
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.filepicker_url_changed?
      image = Magick::ImageList.new
      image.from_blob open(@ticket.filepicker_url).read
      image.quantize(256, GRAYColorspace)
      
      puts image.class.name
      image = Image.new(image.to_blob)
      lines = image.text_lines
      @ticket.citation_number = lines[0][/\s[0-9]+/].strip
      @ticket.license_number = lines[2]
      @ticket.license_number = lines[7]
      @ticket.fine_amount = lines[12]
      
    end

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update_attributes(params[:ticket])
      head :no_content
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    head :no_content
  end
end
