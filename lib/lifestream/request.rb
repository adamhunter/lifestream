module Lifestream
  class Request
    
    attr_accessor :url, :max_redirects
  
    def initialize(url, options = {})
      @url = url
      options[:max_redirects] ||= 5
      @max_redirects = options[:max_redirects]
    end
    
    def get(url = @url)
      check_max_redirects
      url, request = build_request(url)
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.request(request)
      end
      if response.kind_of?(Net::HTTPRedirection)
        @redirect += 1
        get(response.header['location'])
      else
        response
      end
    end
    
    protected
    
    def build_request(url)
       url = URI.parse(url)
       request  = Net::HTTP::Get.new("#{url.path}?#{url.query}", {'User-Agent' => 'Gecko'})
       return url, request
    end
    
    def check_max_redirects
      @redirect ||= 0
      raise TooManyRedirects if @redirect > @max_redirects
    end
    
    class TooManyRedirects < StandardError; end
    
  end
end