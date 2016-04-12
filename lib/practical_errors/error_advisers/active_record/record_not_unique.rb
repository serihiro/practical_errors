module PracticalErrors
  module ErrorAdvisers
    module ActiveRecord
      class RecordNotUnique
        def self.advise(exception)
          <<-EOS.strip_heredoc
            The column included in the record that you were about to insert or update, is not allowed duplicated value.
            This error was detected by database, not Rails.

            You might have configured uniqueness validation to this column, but uniqueness validation is not panacea.
            In race condition, uniqueness validation was passed easily.

            For more detail, see rails document
            http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#method-i-validates_uniqueness_of
          EOS
        end
      end
    end
  end
end
