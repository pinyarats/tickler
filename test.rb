require 'tesseract'

e = Tesseract::Engine.new do |e|
  e.language  = :eng
  e.blacklist = '|'
end

puts e.text_for('public/ticket.jpg').strip # => 'ABC'