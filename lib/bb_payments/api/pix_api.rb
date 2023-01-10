# frozen_string_literal: true

# Transferência-PIX
# POST /lotes-transferencias-pix # Efetuar Pagamentos em Lote via Transferência PIX
# GET  /lotes-transferencias-pix/{id}/solicitacao # Consultar Solicitação de Transferências PIX
module BancoBrasilPayments::PixApi
  extend BancoBrasilPayments::Base

  without_http_info_meths :send_batch_transfer_pix, :find_batch_transfer_pix

  # POST /lotes-transferencias-pix # Efetuar Pagamentos em Lote via Transferência PIX
  def send_batch_transfer_pix_with_http_info(body, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.send_batch_transfer_pix ...'
    end
    # verify the required parameter 'body' is set
    if @api_client.config.client_side_validation && (body.nil? || !body.valid?)
      base_msg = "Invalid required parameter 'body' when calling TransfersApi.send_batch_transfer_pix. "
      reason_msg = "Parameter missing" if body.nil?
      reason_msg = "#{body.list_invalid_properties}" if body.present?
      fail ArgumentError, "#{base_msg} #{reason_msg}"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.send_batch_transfer_pix"
    end
    # resource path
    local_var_path = '/lotes-transferencias-pix'

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

    return_type = opts[:return_type] || 'BatchPixResponse'

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
      @api_client.config.logger.debug "API called: TransfersApi#send_batch_transfer_pix\n"\
                                        "Data: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end

  # GET  /lotes-transferencias-pix/{id}/solicitacao # Consultar Solicitação de Transferências PIX
  def find_batch_transfer_pix_with_http_info(id, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.consult_payments ...'
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.consult_payments"
    end
    # verify the required parameter 'start_date' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.find_batch_transfer_pix"
    end

    # resource path
    local_var_path = "/lotes-transferencias-pix/#{id}/solicitacao"

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key
    query_params[:'index'] = opts[:'index'] if !opts[:'index'].nil?

    # header parameters
    header_params = opts[:header_params] || {}
    # HTTP header 'Accept' (if needed)
    header_params['Accept'] = @api_client.select_header_accept(['application/json'])

    # form parameters
    form_params = opts[:form_params] || {}

    # http body (model)
    post_body = opts[:body]

    return_type = opts[:return_type] || 'Object'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                      :base_path => '/pagamentos-lote/v1',
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#consult_payments\n"\
          "Data: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
end
