require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'

APPLICATION_NAME = 'Calendar API Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-api-quickstart.json")
SCOPE = 'https://www.googleapis.com/auth/calendar.readonly'

def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
  storage = Google::APIClient::Storage.new(file_store)
  auth = storage.authorize

  if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
    app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
    flow = Google::APIClient::InstalledAppFlow.new({
      :client_id => app_info.client_id,
      :client_secret => app_info.client_secret,
      :scope => SCOPE})
    auth = flow.authorize(storage)
    puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
  end
  auth
end

# Initialize the API
client = Google::APIClient.new(:application_name => APPLICATION_NAME)
calendar_api = client.discovered_api('calendar', 'v3')
client.authorization = authorize

# Fetch the next 10 events for the user
results = client.execute!(
  :api_method => calendar_api.events.list,
  :parameters => {
    :calendarId => 'primary',
    :maxResults => 10,
    :singleEvents => true,
    :orderBy => 'startTime',
    :timeMin => Time.now.iso8601 })

puts "Upcoming events:"
puts "No upcoming events found" if results.data.items.empty?
results.data.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end

# drive = client.discovered_api('drive', 'v2')

# media = Google::APIClient::UploadIO.new('mymovie.m4v', 'video/mp4')
# metadata = {
#     'title' => 'My movie',
#     'description' => 'The best home movie ever made'
# }
# client.execute(:api_method => drive.files.insert,
#                :parameters => { 'uploadType' => 'multipart' },
#                :body_object => metadata,
#                :media => media )