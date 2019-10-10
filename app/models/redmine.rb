class Redmine < ActiveResource::Base
  self.site = 'http://192.168.11.47'
  self.user = 'orkun'
  self.password = 'Ngjlu124'
  # Or you can use the Redmine-API key
  # self.headers['X-Redmine-API-Key'] = 'baz'
end
