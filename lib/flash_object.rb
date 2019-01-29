# Message object that used in flash
class FlashObject
  attr_reader :user

  DEFAULT_STYLES = {
    :success => "positive",
    :error => "negative",
    :warning => "warning",
    :info => "info"
  }

  # Message initialization
  #
  # @params [String|Hash] params
  # @option params [String] :title
  # @option params [String] :body
  # @option params [Symbol] :status
  # @option params [String] :style
  # @option params [Symbol] :status
  def initialize(params)
    if params.is_a? Hash
      params.each do |key, value|
        send "#{key}=", value
      end
    elsif params.is_a? String
      @body = params
    else
      raise "Wrong options type: it can be String or Hash."
    end
  end

  # Message title
  def title
    (@title.nil? || @title.blank?) ? I18n.t("flash.common.#{status}.title") : @title.to_s
  end
  def title=(s)
    @title = s.to_s
  end

  # Message body
  def body
    if @body.nil? || @body.blank?
      I18n.t "flash.common.#{status}.body", :raise => true rescue ""
    else
      @body.to_s
    end
  end
  alias_method :message, :body
  def body=(s)
    @body = s.to_s
  end
  alias_method :message=, :body=

  # Status
  def status
    (@status.nil? || @status.to_s.blank?) ? :info : @status.to_sym
  end
  def status=(s)
    if s.is_a?(String) || s.is_a?(Symbol)
      @status = s.to_sym

      @status = :success if @status == :notice
      @status = :error if @status == :alert
    end
  end

  # Message style
  def style
    if @style.nil? || @style.blank?
      (DEFAULT_STYLES[status].nil?) ? "info" : DEFAULT_STYLES[status]
    else
      @style.to_s
    end
  end
  def style=(s)
    @style = s.to_s if s.is_a?(String) || s.is_a?(Symbol)
  end
end
