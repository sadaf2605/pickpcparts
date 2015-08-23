module BuildsHelper
  def editable
    return session[:build_token]==@current_build.token || @current_build.new_record?
  end
  def sharable
    return (session[:build_token]==@current_build.token) 
  end
end
