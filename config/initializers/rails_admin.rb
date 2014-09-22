RailsAdmin.config do |config|

Kaminari.configure do |config|
config.page_method_name = :per_page_kaminari
end
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
  authenticate_or_request_with_http_basic do |username, password|
      username == 'Master' &&
      password == 'hakunamatata'
    end
  end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
