class MarketplaceController < ReaderActionController
  REGISTER_PATH = '/membership/register'
  FFT_MEMBERS_AREA_PATH = '/membership/membership'
  
  radiant_layout { |c| Radiant::Config['reader.layout'] }
  
  protected
  def require_membership
    if (current_reader.group_ids & [StnzSettings.fft_marketplace_group_id, StnzSettings.st_group_id ]).empty?
      flash[:error] = 'Sorry, but you must belong to Farm Forestry Timbers Group'
      redirect_to root_path
    end
  end
end
