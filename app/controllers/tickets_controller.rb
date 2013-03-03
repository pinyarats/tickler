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
      image = open(@ticket.filepicker_url).read
      puts image.class.name

      e = Tesseract::Engine.new do |e|
        e.language  = :eng
        e.blacklist = '|'
      end
      
      lines = e.each_line_for(image) do |b| puts b.to_s end
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
