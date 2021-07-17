module Cock::HomesHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:cock]
  end
  
  def resource
    @resource ||= Cock.new
  end
end
