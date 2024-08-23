if Rails.env.development? || Rails.env.test?
  require 'pry'
  require 'pry-byebug'
end