# frozen_string_literal: true

# openapi: 3.0.1
# info:
#   title: Pagamentos em Lote
#   description: API para realizar consultas, requisições, liberações, cancelamentos, etc., de pagamento/transferências em lote.
#   contact:
#     name: Banco do Brasil S.A. - BB for Developers
#     url: https://developers.bb.com.br
#   version: '1.41'
# externalDocs:
#   description: Saiba mais sobre o fluxo de autorização do Oauth
#   url: https://developers.bb.com.br/docs/oauth/
# servers:
#   - url: https://api.desenv.bb.com.br/pagamentos-lote/v1
#     description: Desenvolvimento
#   - url: https://api.hm.bb.com.br/pagamentos-lote/v1
#     description: Homologação
#   - url: https://api-ip.bb.com.br/pagamentos-lote/v1
#     description: Produção
module BancoBrasilPayments::BatchPayments
  extend BancoBrasilPayments::Base
  include  BancoBrasilPayments::PixApi

  without_http_info_meths :consult_payments, :liberar_pagamentos, :find_batch_payments

  def swagger(opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.consult_payments ...'
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.consult_payments"
    end

    local_var_path = '/swagger'

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key

    # header parameters
    header_params = opts[:header_params] || {}
    # HTTP header 'Accept' (if needed)
    header_params['Accept'] = @api_client.select_header_accept(['application/json'])

    # form parameters
    form_params = opts[:form_params] || {}

    # http body (model)
    post_body = opts[:body]

    return_type = opts[:return_type] || 'String'

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
    return data
  end

  # Permite que a empresa efetue a liberação dos lotes de pagamentos diretamente de seu sistema de gestão - ERP.
  # @param id Numero da requisiçãoujos pagamentos estão sendo liberados.
  # @param float Indicador de concordância da tarifa de antecipacao.
  def liberar_pagamentos_with_http_info(id, float, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.liberar_pagamentos ...'
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.liberar_pagamentos"
    end
    # verify the required parameter 'id' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.liberar_pagamentos"
    end
    # verify the required parameter 'end_date' is set
    if @api_client.config.client_side_validation && float.nil?
      fail ArgumentError, "Missing the required parameter 'float' when calling TransfersApi.liberar_pagamentos"
    end

    # resource path
    local_var_path = '/liberar-pagamentos'

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key

    # header parameters
    header_params = opts[:header_params] || {}
    # HTTP header 'Accept' (if needed)
    header_params['Accept'] = @api_client.select_header_accept(['application/json'])

    # form parameters
    form_params = opts[:form_params] || {}

    # http body (model)
    post_body = opts[:body] || {}
    post_body[:'numeroRequisicao'] = id
    post_body[:'indicadorFloat'] = float ? 'S' : 'N'

    return_type = opts[:return_type] || 'Hash<String, String>'

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
      message = "API called: TransfersApi#liberar_pagamentos\n"\
                  "Data: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      @api_client.config.logger.debug message
    end
    return data, status_code, headers
  end

  # Consulta os pagamentos e transferências das requisição feitas para efetuar pagamentos em lote,
  # inclusive pagamentos e transferências relacionados ao PIX.
  # Detre as informações consulatas estão o motivo e valores devolvidos.
  #
  # @param start_date Data inicial de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param end_date Data final de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :debit_branch_office Número da agência da conta corrente de débito. Obrigatoriedade conforme fluxo OAuth: 1) Client Credentials: campo opcional; 2) Authorization Code: informação extraída do token.
  # @option opts [Integer] :debit_current_account Número da conta corrente de débito. Obrigatoriedade conforme fluxo OAuth: 1) Client Credentials: campo opcional; 2) Authorization Code: informação extraída do token.
  # @option opts [String] :check_digits_debit_current_account Dígito verificador da conta corrente de débito. Obrigatoriedade conforme fluxo OAuth: 1) Client Credentials: campo opcional; 2) Authorization Code: informação extraída do token.
  # @option opts [Integer] :payment_contract Contrato de pagamento entre o terceiro e o Banco do Brasil. Obrigatoriedade conforme fluxo OAuth: 1) Client Credentials: campo opcional; 2) Authorization Code: informação extraída do token.    # @option opts [String] :payment_state Estados dos pagamentos.
  # @option opts [Integer] :index Posição do índice de paginação.  Indica a posição a partir da qual a pesquisa tratá os registros (ex: valor 0, indica que está trazendo a partir do registro 1, valor 300 indica que está trazendo a partir do 301). Cada resposta tem um limite de 300 ocorrências na lista paymentList, iniciada a partir do valor do índice fornecido. Para todas as ocorrências, itere sobre esse recurso usando o valor do campo nextIndex da resposta
  # @return Hash<String, String> data, response status code and response headers
  def consult_payments_with_http_info(start_date, end_date, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.consult_payments ...'
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.consult_payments"
    end
    # verify the required parameter 'start_date' is set
    if @api_client.config.client_side_validation && start_date.nil?
      fail ArgumentError, "Missing the required parameter 'start_date' when calling TransfersApi.consult_payments"
    end
    # verify the required parameter 'end_date' is set
    if @api_client.config.client_side_validation && end_date.nil?
      fail ArgumentError, "Missing the required parameter 'end_date' when calling TransfersApi.consult_payments"
    end
    # resource path
    local_var_path = '/pagamentos'

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key
    query_params[:'dataInicio'] = start_date.strftime('%d%m%Y').to_i
    query_params[:'dataFim'] = end_date.strftime('%d%m%Y').to_i
    query_params[:'agenciaDebito'] = opts[:'debit_branch_office'] if !opts[:'debit_branch_office'].nil?
    query_params[:'contaCorrenteDebito'] = opts[:'debit_current_account'] if !opts[:'debit_current_account'].nil?
    query_params[:'digitoVerificadorContaCorrente'] = opts[:'check_digits_debit_current_account'] if !opts[:'check_digits_debit_current_account'].nil?
    query_params[:'numeroContratoPagamento'] = opts[:'payment_contract'] if !opts[:'payment_contract'].nil?
    query_params[:'estadoPagamento'] = opts[:'payment_state'] if !opts[:'payment_state'].nil?
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

  # Consulta um lote de pagamentos.
  # GET pagamentos-lote/v1/{id}
  def find_batch_payments_with_http_info(id, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.find_batch_payments ...'
    end
    # verify the required parameter 'id' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.find_batch_payments"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.find_batch_payments"
    end
    # resource path
    local_var_path = id.to_s

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key

    # header parameters
    header_params = opts[:header_params] || {}
    # HTTP header 'Accept' (if needed)
    header_params['Accept'] = @api_client.select_header_accept(['application/json'])

    # form parameters
    form_params = opts[:form_params] || {}

    # http body (model)
    post_body = opts[:body]

    return_type = opts[:return_type] || 'FindBatchResponse'

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
      @api_client.config.logger.debug "API called: TransfersApi#find_batch_payments\nData: #{data.inspect}\n"\
                                      "Status code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
end
