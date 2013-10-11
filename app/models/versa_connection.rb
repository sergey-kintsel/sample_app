module VersaConnection

  TOKEN = 'b21f8f11'
  SITE_URL = 'test-produkte.versacommerce.de'

  @@established=false
  def self.established
    @@established
  end


  def self.establish!
    session  = VersacommerceAPI::Session.new(SITE_URL,TOKEN)
    if session.valid?
      VersacommerceAPI::Base.activate_session(session)
      @@established = true
    else
      @@established = false
      raise 'NotValidSession'
    end

  end

  def self.established?
    @@established
  end
  
  def self.check_connection
    VersaConnection.establish! unless VersaConnection.established?
  end
end