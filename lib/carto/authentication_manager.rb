module Carto
  class AuthenticationManager

    def self.validate_session(warden_context, request, user, reset_session_on_error = true)
      return true if session_security_token_valid?(warden_context, user)

      request.reset_session if reset_session_on_error
      false
    end

    def self.session_security_token_valid?(warden_context, user)
      session = warden_context.session(user.username)

      return false unless session.key?(:sec_token)
      return true if session[:sec_token] == user.security_token

      raise Carto::ExpiredSessionError
    rescue Warden::NotAuthenticated
      false
    end
    private_class_method :session_security_token_valid?

  end
end