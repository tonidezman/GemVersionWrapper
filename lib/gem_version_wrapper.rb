require "gem_version_wrapper/version"

module GemVersionWrapper
  def self.build(str)
    begin
      Gem::Version.new str
    rescue ArgumentError => e
      if defined? Rails.logger.error
        Rails.logger.error("#{e}: invalid version input from DB => Gem::Version.new(#{str})")
      end

      handle_invalid str
    end
  end

  private

  def self.handle_invalid(str)
    if unprocessable_input? str
      Gem::Version.new ''
    else
      Gem::Version.new str.to_f
    end
  end

  def self.unprocessable_input?(str)
    str.to_f == 0.0
  end
end
