require 'pdfkit'
Rails.application.config.middleware.use PDFKit::Middleware


# Modify asset host config setting in `config/application.rb`
# Or create a new initializer: `config/initializers/wkhtmltopdf.rb`
#Rails.application.config.action_controller.asset_host = "http://127.0.0.1:3000"

# Or you can have different hosts for development (local) and production (CDN):
# In `config/environments/development.rb`
#Rails.application.action_controller.asset_host = "http://127.0.0.1:3000"
# In `config/environments/production.rb`
#Rails.application.config.action_controller.asset_host = "http://127.0.0.1:3000"

ActionController::Base.asset_host="http://127.0.0.1:3000"

