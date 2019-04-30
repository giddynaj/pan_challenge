class PanjivaApi
  SUPPLIER_URL = 'https://api.panjiva.com/api/v1/search/supplier'
  COMPANY_URL = 'https://api.panjiva.com/api/v1/company/'

  def self.get(type, args={})
    uri = URI.parse(self.build_query(type, args))
    Rails.logger.debug(self.build_query(type, args))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.to_s)
    req['AUTHORIZATION'] = 'Bearer 0LTJmRfrmfrRoMzGkFGZNAp9x5NDFwZqQnygiHoS'
    res = http.request(req) 
  end

  def self.build_query(type, args={})
    case type
    when 'supplier'
      keywords = args[:keywords].gsub(" ", "+")
      SUPPLIER_URL + "?query=#{keywords}&offset=0&limit=10"
    when 'company'
      COMPANY_URL + args[:id].to_s
    end
  end
end
