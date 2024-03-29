=begin
#Payments-VPN

#Esta API fornece os serviços de pagamento do Banco do Brasil.

OpenAPI spec version: 3.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.24
=end

module BancoBrasilPayments
  class CancelApi
    attr_accessor :api_client, :gw_app_key

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
      @gw_app_key = @api_client.config.gw_app_key
    end
    # Cancels a request for transfers in batch
    # Cancela, em lote, solicitações de transferências e de pagamentos boletos e guias, requisitadas através dos recursos: /batch-transfers (POST), /barcode-collection-forms (POST), /payments-vpn/v2/batch-slips (POST).
    # @param body Objeto de Requisição do recurso Batch Transfers Cancel
    # @param [Hash] opts the optional parameters
    # @return [RootTypeForBatchTransfersCancelResponseObject]
    def cancelamento_transferencia_lote(body, opts = {})
      data, _status_code, _headers = cancelamento_transferencia_lote_with_http_info(body, opts)
      data
    end

    # Cancels a request for transfers in batch
    # Cancela, em lote, solicitações de transferências e de pagamentos boletos e guias, requisitadas através dos recursos: /batch-transfers (POST), /barcode-collection-forms (POST), /payments-vpn/v2/batch-slips (POST).
    # @param body Objeto de Requisição do recurso Batch Transfers Cancel
    # @param [Hash] opts the optional parameters
    # @return [Array<(RootTypeForBatchTransfersCancelResponseObject, Integer, Hash)>] RootTypeForBatchTransfersCancelResponseObject data, response status code and response headers
    def cancelamento_transferencia_lote_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CancelApi.cancelamento_transferencia_lote ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CancelApi.cancelamento_transferencia_lote"
      end
      # verify the required parameter 'gw_app_key' is set
      if @api_client.config.client_side_validation && gw_app_key.nil?
        fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling CancelApi.cancelamento_transferencia_lote"
      end
      # resource path
      local_var_path = '/batch-transfers/cancel'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[@api_client.config.app_key_name.to_sym] = gw_app_key

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(body)

      return_type = opts[:return_type] || 'RootTypeForBatchTransfersCancelResponseObject'

      auth_names = opts[:auth_names] || ['OAuth2-CC']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CancelApi#cancelamento_transferencia_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # POST /cancelar-pagamentos Cancelar Lote de Pagamentos
    # Efetua o Cancelamento de um Lote de Pagamentos
    def cancel_payments_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CancelApi.cancelamento_pagamentos ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CancelApi.cancelamento_pagamentos"
      end
      # verify the required parameter 'gw_app_key' is set
      if @api_client.config.client_side_validation && gw_app_key.nil?
        fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling CancelApi.cancelamento_pagamentos"
      end
      # resource path
      local_var_path = '/cancelar-pagamentos'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[@api_client.config.app_key_name.to_sym] = gw_app_key

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(body)

      return_type = opts[:return_type] ||  'Hash<String, Array<Object>>' # TODO: define type>>

      auth_names = opts[:auth_names] || ['OAuth2-CC']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        :base_path => '/pagamentos-lote/v1',
                                                        :header_params => header_params,
                                                        :query_params => query_params,
                                                        :form_params => form_params,
                                                        :body => post_body,
                                                        :auth_names => auth_names,
                                                        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug 'API called: CancelApi#cancelamento_pagamentos\nData: '\
                                                 "#{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
