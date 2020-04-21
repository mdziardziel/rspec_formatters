RSpec::Support.require_rspec_core "formatters/base_text_formatter"

class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed,
                                   :dump_pending, :dump_failures, :dump_summary

  def example_passed(message)
    output.print colorizer.wrap('+', RSpec.configuration.success_color)
  end

  def example_pending(message)
    super
  end

  def example_failed(message)
    output.print colorizer.wrap('-', RSpec.configuration.failure_color)
  end

  def dump_pending(message)
    super
  end

  def dump_failures(message)
    super
  end

  def dump_summary(message)
    output.puts "\nFinished in #{message.formatted_duration} " \
       "(files took #{message.formatted_load_time} to load)\n" \
       "#{message.colorized_totals_line(colorizer)}\n"
  end

  def colorizer
    ::RSpec::Core::Formatters::ConsoleCodes
  end
end
