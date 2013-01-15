class InvalidTicketException < RuntimeError
  attr :message 
  
  def initialize(message)
    @message = message
  end
  
end