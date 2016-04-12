# error list
# https://github.com/rails/rails/blob/4-2-stable/activerecord/lib/active_record/errors.rb
module PracticalErrors
  module Practicable
    def arrange_exception!(exception)
      @customised_message = ''

      append_header

      abstract_original_message(exception)

      if PracticalErrors::ErrorAdvisers::const_defined?(exception.class.to_s)
        @customised_message << PracticalErrors::ErrorAdvisers::const_get(exception.class.to_s).advise(exception)
      else
        @customised_message << <<-"EOS".strip_heredoc
          hmm... I don't know this error :(
          Tell me => https://github.com/serihiro/practical_errors
        EOS
      end

      append_footer

      exception.message.gsub!(/.+/, @customised_message)
    end

    private

    def append_header
      @customised_message << <<-EOS.strip_heredoc

        ========== Practical Errors appends message from here ==========
      EOS
    end

    def append_footer
      @customised_message << <<-EOS.strip_heredoc

        ========== Practical Errors appends message to here ==========
        See more detail about Practical Errors: https://github.com/serihiro/practical_errors

      EOS
    end

    def abstract_original_message(exception)
      original_message = exception.message
      @customised_message << <<-"EOS".strip_heredoc

          Rails says, "#{original_message}".

      EOS
    end
  end
end
