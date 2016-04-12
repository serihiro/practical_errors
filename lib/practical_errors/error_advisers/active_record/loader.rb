module PracticalErrors
  module ErrorAdvisers
    module ActiveRecord
      %w(record_not_found record_not_unique).each do |file|
        require File.join(File.expand_path('../', __FILE__), file)
      end
    end
  end
end
