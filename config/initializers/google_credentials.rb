# require 'base64'

# # On ne charge les credentials que si on n’est pas en précompilation
# unless ARGV.include?('assets:precompile')
#   if ENV['GOOGLE_CREDENTIALS']
#     json_key = Base64.decode64(ENV['GOOGLE_CREDENTIALS'])

#     file_path = Rails.root.join('config', 'environments', 'winter-inquiry-453808-i5-3a146061dabc.json')

#     File.open(file_path, 'w') { |f| f.write(json_key) }

#     ENV['GOOGLE_APPLICATION_CREDENTIALS'] = file_path.to_s
#   end
# end
