class Group < ApplicationRecord
attr_encrypted_options.merge!(key: '/Users/macbook/Development')
  attr_encrypted :ssn
  attr_encrypted :app
end

Group.create!(ssn: ENV.fetch('ssn'), app_id: ENV.fetch('app_id'))