module BuildsHelper
  def editable
    return session[:build_token]==@build.token || @build.new_record?
  end
  def sharable
    return (session[:build_token]==build.token) 
  end
end
