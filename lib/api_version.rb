# Controller for API version
class ApiVersion
  def initialize(version)
    @version = version
  end

  def matches?(request)
    versioned_accept_header?(request) || version_one?(request)
  end

  protected

    def versioned_accept_header?(request)
      accept = request.headers['Accept']

      accept && accept[/application\/vnd\.genbank-v#{@version}\+json/]
    end

    def unversioned_accept_header?(request)
      accept = request.headers['Accept']

      accept.blank? || accept[/application\/vnd\.genbank/].nil?
    end

    def version_one?(request)
      (@version == 1 || @version == 2) && unversioned_accept_header?(request)
    end
end
