require 'net/http'
require 'pry'

module Api::V1
  class ShippersController < ApplicationController
    before_action :set_shipper, only: [:show, :update, :destroy]

    # GET /shippers
    def index
      if true 
      companies = []
      res = PanjivaApi.get('supplier', { keywords: params['keywords']})
      res = JSON.parse(res.body)
      company_ids = res['results'].map do |ship|
        ship['id']
      end
    
      companies = company_ids.map do |company_id|
        res = PanjivaApi.get('company',{id: company_id })
        res.body.encode("UTF-8", invalid: :replace, undef: :replace)
      end
      
      #@shippers = Shipper.all
      @shippers = { 'companies' => companies }.to_json
      puts @shippers
      else
      @shippers = {"companies":["{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.534,\"results\":{\"id\":37659873,\"duns\":[],\"name\":\"K H Exports India Private Limited\",\"name_cn\":{},\"type\":\"supplier\",\"address\":{\"formatted\":\"College Road, Subba Road Avenue, Nungambakkam, Chennai, Tamil Nadu 600006, India\",\"primary_address\":\"College Road\",\"city\":\"Chennai\",\"region_2\":\"Chennai\",\"region_3\":null,\"state\":\"Tamil Nadu\",\"postal_code\":\"600006\",\"country\":\"IN\",\"country_name\":\"India\",\"latitude\":13.0678296,\"longitude\":80.248125},\"phone\":null,\"fax\":null,\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":24934,\"data_sources\":[\"india_export_shipments\",\"mexico_import_shipments\"],\"top_customers\":[{\"pid\":44468394,\"name\":\"H \u0026 M Hennes And Mauritz Ab \u0026 Co.\",\"count\":812},{\"pid\":27819636,\"name\":\"H \u0026 M Hennes \u0026 Mauritz Inc.\",\"count\":808},{\"pid\":44604653,\"name\":\"Coach Services Inc Ftz 64,.\",\"count\":767}]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.484,\"results\":{\"id\":30234872,\"duns\":[\"545259913\"],\"name\":\"Tongxiang Gaoqiao Leather Co., Ltd.\",\"name_cn\":{\"etcn\":[\"���������������������������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"Gaoqiaozhen, Tongxiang, Jiaxing, Zhejiang, China\",\"primary_address\":null,\"city\":\"Jiaxing\",\"region_2\":null,\"region_3\":null,\"state\":\"Zhejiang\",\"postal_code\":null,\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":30.522216,\"longitude\":120.548237},\"phone\":\"+86 573 8896 6001\",\"fax\":\"+86 573 8896 6195\",\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.434,\"results\":{\"id\":15619776,\"duns\":[\"547583685\"],\"name\":\"Zibo Dahuan Jiubaoen Leather Group Co., Ltd.\",\"name_cn\":{\"etcn\":[\"���������������������������������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"186 Zhang Bei Lu, Huantai Xian, Zibo Shi, Shandong Sheng, China, 256410\",\"primary_address\":\"186��� Zhang Bei Lu\",\"city\":\"Zibo Shi\",\"region_2\":null,\"region_3\":null,\"state\":\"Shandong Sheng\",\"postal_code\":\"256410\",\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":36.8995309,\"longitude\":118.0877583},\"phone\":\"+86 865338161343\",\"fax\":null,\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.384,\"results\":{\"id\":39614714,\"duns\":[],\"name\":\"Pou (Suizhou) Leather Co., Ltd.\",\"name_cn\":{\"etcn\":[\"������(������)������������������\",\"������(������)������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"Hubei, China\",\"primary_address\":null,\"city\":null,\"region_2\":null,\"region_3\":null,\"state\":\"Hubei\",\"postal_code\":null,\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":30.545861,\"longitude\":114.341921},\"phone\":null,\"fax\":null,\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.334,\"results\":{\"id\":15477473,\"duns\":[],\"name\":\"Hubei New Leather (Group) Co., Ltd.\",\"name_cn\":{\"etcn\":[\"������������������(������)������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"Hubei, China\",\"primary_address\":null,\"city\":null,\"region_2\":null,\"region_3\":null,\"state\":\"Hubei\",\"postal_code\":null,\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":30.545861,\"longitude\":114.341921},\"phone\":null,\"fax\":null,\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.284,\"results\":{\"id\":27195819,\"duns\":[\"420398731\"],\"name\":\"Zhejiang Tongtianxing Group JSC Ltd.\",\"name_cn\":{\"etcn\":[\"���������������������������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"100 Shang Jie, Kecheng Qu, Quzhou Shi, Zhejiang Sheng, China, 324000\",\"primary_address\":\"100��� Shang Jie\",\"city\":\"Quzhou Shi\",\"region_2\":null,\"region_3\":null,\"state\":\"Zhejiang Sheng\",\"postal_code\":\"324000\",\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":28.9516172,\"longitude\":118.8739198},\"phone\":null,\"fax\":\"+86 570 604 7399\",\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.234,\"results\":{\"id\":27955150,\"duns\":[\"859651377\",\"650466217\",\"859650139\",\"002573744\"],\"name\":\"Damco India Pvt., Ltd.\",\"name_cn\":{},\"type\":\"supplier\",\"address\":{\"formatted\":\"India\",\"primary_address\":null,\"city\":null,\"region_2\":null,\"region_3\":null,\"state\":null,\"postal_code\":null,\"country\":\"IN\",\"country_name\":\"India\",\"latitude\":20.593684,\"longitude\":78.96288},\"phone\":null,\"fax\":\"+91 912233088222\",\"email\":[],\"top_products\":[\"col palmitas polanco\",\"piso col palmitas polanco\",\"piso col palmitas\",\"oscar calderon ext\",\"zquez oscar calderon\"],\"websites\":[\"http://www.damco.com\",\"http://www.indianexporters.com/damco-as-com-555642854.html\",\"http://suppliers.jimtrade.com/157/156365\"],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":\"2019-04-28\",\"shipment_count\":72024,\"data_sources\":[\"colombia_imports\",\"ecuador_imports\",\"sri_lanka_imports\",\"us_imports\",\"us_exports\"],\"top_customers\":[{\"pid\":32411530,\"name\":\"Homegoods\",\"count\":9511},{\"pid\":27898045,\"name\":\"JC Penney Purchasing Corp.\",\"count\":7326},{\"pid\":32423494,\"name\":\"Newton Buying Corp.\",\"count\":4944}]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.184,\"results\":{\"id\":27758868,\"duns\":[\"543040705\"],\"name\":\"Foshan Nanhai Qingsong Leather Products Co., Ltd.\",\"name_cn\":{\"etcn\":[\"������������������������������������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"Foshan, Guangdong, China\",\"primary_address\":null,\"city\":\"Foshan\",\"region_2\":null,\"region_3\":null,\"state\":\"Guangdong\",\"postal_code\":null,\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":23.021548,\"longitude\":113.121416},\"phone\":null,\"fax\":null,\"email\":[],\"top_products\":[\"camera\",\"nylon\",\"part cargoes\",\"pvc cell\",\"nylon camera\"],\"websites\":[\"http://www.wdtrade.com/showroom/145461/Foshan_City_Nanhai_Yanbu_Qisheng_Leather_Product_Co_Ltd_.aspx\",\"http://www.asia.ru/en/CompanyList/?company_id=58144\",\"http://www.asianproducts.com/company/A11680503965237813/foshan-city-nanhai.html\",\"http://www.diytrade.com/china/manufacturer/506882/main/Foshan_City_Nanhai_Yanbu_Qisheng_Leather_Product_Co_Ltd.html\",\"http://www.diytrade.com/china/4/manufacturers/506882/main/Foshan_City_Nanhai_Yanbu_Qisheng_Leather_Product_Co_Ltd.html\",\"http://www.aerfeis.com.cn\",\"http://nowcom.en.busytrade.com\",\"http://www.znno.com/Foshan-City-Nanhai-Yanbu-Qisheng-Leather-Product-Co-Ltd\",\"http://www.toocle.com/ChinaSuppliers/110064\",\"http://company400.com/company/aerfeis.html\",\"http://nowcom.en.busytrade.com/about_us.html\",\"http://www.companycoltd.com/company_coltd.php?company_id=c227457\"],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.134,\"results\":{\"id\":33727822,\"duns\":[\"529465310\"],\"name\":\"Guangzhou Yi Feng Leather Products C.\",\"name_cn\":{\"etcn\":[\"������������������������������������\"]},\"type\":\"supplier\",\"address\":{\"formatted\":\"Tianhe, Guangzhou, Guangdong, China, 510663\",\"primary_address\":null,\"city\":\"Guangzhou\",\"region_2\":null,\"region_3\":null,\"state\":\"Guangdong\",\"postal_code\":\"510663\",\"country\":\"CN\",\"country_name\":\"China\",\"latitude\":23.1733055,\"longitude\":113.4212211},\"phone\":null,\"fax\":\"+86 862034354273\",\"email\":[],\"top_products\":[],\"websites\":[\"http://www.yfpackaging.com\",\"http://yfgiftbox.en.alibaba.com\",\"http://topfreebiz.com/company/358670/Guangzhou-Yichang-Paper-Products-Co.-Ltd.htm\",\"http://yfgiftbox.en.alibaba.com/company_profile.html#top-nav-bar\"],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":0,\"data_sources\":[\"chinese_trade_data\"]}}","{\"endpoint\":\"companies\",\"request\":\"show\",\"credits_charged\":0.05,\"credits_remaining\":99999909.084,\"results\":{\"id\":44670076,\"duns\":[],\"name\":\"Farida Shoes Private Limited\",\"name_cn\":{},\"type\":\"supplier\",\"address\":{\"formatted\":\"No. 17, Jalal Road, Mootukollai, Ambur, Tamil Nadu 635802, India\",\"primary_address\":null,\"city\":\"Ambur\",\"region_2\":null,\"region_3\":null,\"state\":\"Tamil Nadu\",\"postal_code\":\"635802\",\"country\":\"IN\",\"country_name\":\"India\",\"latitude\":12.7953262,\"longitude\":78.7120682},\"phone\":null,\"fax\":null,\"email\":null,\"top_products\":[],\"websites\":[],\"contact\":{\"person\":null,\"email\":null,\"phone\":null,\"fax\":null},\"most_recent_shipment_date\":null,\"shipment_count\":9741,\"data_sources\":[\"india_export_shipments\",\"bolivia_import_shipments\",\"sri_lanka_imports\"],\"top_customers\":[{\"pid\":44723405,\"name\":\"M/S. Weyco Group Inc\",\"count\":1306},{\"pid\":33588956,\"name\":\"The Rockport Co. Llc\",\"count\":850},{\"pid\":33672298,\"name\":\"Marks And Spencer Plc\",\"count\":367}]}}"]}
      end
      render json: @shippers
    end

    # GET /shippers/1
    def show
      render json: @shipper
    end

    # POST /shippers
    def create
      @shipper = Shipper.new(shipper_params)

      if @shipper.save
        render json: @shipper, status: :created, location: @shipper
      else
        render json: @shipper.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /shippers/1
    def update
      if @shipper.update(shipper_params)
        render json: @shipper
      else
        render json: @shipper.errors, status: :unprocessable_entity
      end
    end

    # DELETE /shippers/1
    def destroy
      @shipper.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_shipper
        @shipper = Shipper.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def shipper_params
        params.require(:shipper).permit(:name, :address, :phone)
      end
  end
end
