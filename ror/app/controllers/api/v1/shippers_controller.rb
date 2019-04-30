require 'net/http'
require 'pry'

module Api::V1
  class ShippersController < ApplicationController
    before_action :set_shipper, only: [:show, :update, :destroy]

    # GET /shippers
    def index
      companies = []
      res = PanjivaApi.get('supplier')
      res = JSON.parse(res.body)
      company_ids = res['results'].map do |ship|
        ship['id']
      end
    
      companies = company_ids.map do |company_id|
        res = PanjivaApi.get('company',{id: company_id, keyword: })
        res.body.encode("UTF-8", invalid: :replace, undef: :replace)
      end
      
      #@shippers = Shipper.all
      @shippers = { 'companies' => companies }.to_json
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
