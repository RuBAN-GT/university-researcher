module FlashHelper
  # Get all messages output
  #
  # @return [String] with html
  def flash_all
    result = []

    flash.each do |status, messages|
      messages.each do |message|
        message = FlashObject.new :message => message, :status => status

        result << render('/web/flash/flash', :notification => message)
      end if messages.is_a? Array

      flash.discard status
    end

    result.join($/).html_safe
  end

  # Get message output
  #
  # @see [FlashObject]
  #
  # @param [Hash|String] params
  # @return [String] with html
  def flash_block(params)
    begin
      f = FlashObject.new params

      render '/web/flash/flash', :notification => f
    rescue
      ""
    end
  end
end
