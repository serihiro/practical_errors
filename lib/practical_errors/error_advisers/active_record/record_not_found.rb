module PracticalErrors
  module ErrorAdvisers
    module ActiveRecord
      class RecordNotFound
        def self.advise(exception)
          values = %r{\ACouldn't find (.*?) with '(.*?)'=(.*)\Z}.match(exception.message)

          <<-"EOS".strip_heredoc
            You might have called ActiveRecord::FinderMethods#find, but the record for provided id was not found.
            If you DO NOT want to raise ActiveRecord::RecordNotFound even if the record was not found,
            you should use ActiveRecord::FinderMethods#find_by instead.

            #{values[1]}.find(#{values[3]}) # raise ActiveRecord::RecordNotFound
            #{values[1]}.find_by(#{values[2]}: #{values[3]}) # just returns nill

          EOS
        end
      end
    end
  end
end
