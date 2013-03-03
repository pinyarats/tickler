class Image < ActiveRecord::Base
  def initialize(image)
    @engine = Tesseract::Engine.new do |e|
      e.language  = :eng
      e.whitelist = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 /#%-$" 
    end
    @image = image
  end
  
  def text_lines
    lines = []
    @engine.each_line_for(@image) do |line| 
      lines << line
    end
    lines.reject! { |l| l.empty? }
  end
end

