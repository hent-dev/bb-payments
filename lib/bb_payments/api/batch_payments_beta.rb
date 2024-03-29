# frozen_string_literal: true

# openapi: 3.0.1
# info:
#   title: Payments-VPN
#   description: Esta API fornece os serviços de pagamento do Banco do Brasil.
#   contact:
#     name: Banco do Brasil S.A.
#     url: 'https://developers.bb.com.br'
#   version: '3.5'
# externalDocs:
#   description: Saiba mais sobre o fluxo de autorização do Oauth
#   url: 'https://developers.bb.com.br/docs/oauth/'
# servers:
#   - url: 'https://api.desenv.bb.com.br/payments-vpn/v3'
#     description: Desenvolvimento
#   - url: 'https://api.hm.bb.com.br/payments-vpn/v3'
#     description: Homologação
#   - url: 'https://api.bb.com.br/payments-vpn/v3'
#     description: Produção
module BancoBrasilPayments::BatchPaymentsBeta
  extend BancoBrasilPayments::Base

  without_http_info_meths :consulta_pagamento_transferencias_lote

  # Retrieval of detailed infomation of a specific payment
  # Recupera detalhes de uma transferência específica enviada enviada pela solicitação ao recurso /batch-transfers (POST)
  # @param id Identificação de um pagamento específico para um beneficiário. NÃO é o valor do campo requestIdentification do recurso \&quot;Solicitação para transferências em lote\&quot;, mas o campo paymentId na matriz paymentsList do recurso \&quot;Recuperação de transferências em lote\&quot;.
  # @param [Hash] opts the optional parameters
  # @return [Array<(InlineResponse2001, Integer, Hash)>] InlineResponse2001 data, response status code and response headers
  def consulta_pagamento_transferencias_lote_with_http_info(id, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.consula_pagamento_transferencias_lote ...'
    end
    # verify the required parameter 'id' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.consula_pagamento_transferencias_lote"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.consula_pagamento_transferencias_lote"
    end
    # resource path
    local_var_path = '/batch-transfers/payments/{id}'.sub('{' + 'id' + '}', id.to_s)

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

    return_type = opts[:return_type] || 'InlineResponse2001'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#consula_pagamento_transferencias_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
  # Retrieval from transfers in batch
  # Recupera as informações da solicitação, incluindo a situação da solicitação, e a lista de pagamentos com a situação de cada pagamento da solicitação de transferências em lote. Este recurso tem um limite de 300 ocorrências por resposta.
  # @param id Identificador da requisição de pagamento. Número único, não sequencial, com domínio entre 1 e 999999999.
  # @param [Hash] opts the optional parameters
  # @option opts [BigDecimal] :index Posição do índice. Cada resposta tem um limite de 300 ocorrências na lista paymentList, iniciada a partir do valor do índice fornecido. Para todas as ocorrências, itere sobre esse recurso usando o valor do campo nextIndex da resposta.
  # @return [InlineResponse200]
  def consulta_transferencia_lote(id, opts = {})
    data, _status_code, _headers = consulta_transferencia_lote_with_http_info(id, opts)
    data
  end

  # Retrieval from transfers in batch
  # Recupera as informações da solicitação, incluindo a situação da solicitação, e a lista de pagamentos com a situação de cada pagamento da solicitação de transferências em lote. Este recurso tem um limite de 300 ocorrências por resposta.
  # @param id Identificador da requisição de pagamento. Número único, não sequencial, com domínio entre 1 e 999999999.
  # @param [Hash] opts the optional parameters
  # @option opts [BigDecimal] :index Posição do índice. Cada resposta tem um limite de 300 ocorrências na lista paymentList, iniciada a partir do valor do índice fornecido. Para todas as ocorrências, itere sobre esse recurso usando o valor do campo nextIndex da resposta.
  # @return [Array<(InlineResponse200, Integer, Hash)>] InlineResponse200 data, response status code and response headers
  def consulta_transferencia_lote_with_http_info(id, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.consulta_transferencia_lote ...'
    end
    # verify the required parameter 'id' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.consulta_transferencia_lote"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.consulta_transferencia_lote"
    end
    # resource path
    local_var_path = '/batch-transfers/{id}'.sub('{' + 'id' + '}', id.to_s)

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

    return_type = opts[:return_type] || 'InlineResponse200'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#consulta_transferencia_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
  # Request for transfers in batch
  # Pedido de transferências em lote de pagamento de qualquer tipo (fornecedores, salário ou diversos), por transferência bancária (incluindo outros bancos) ou por depósito judicial.  A solicitação será submetida a uma validação prévia das informações do pagador e das entradas inseridas na lista de pagamentos. Após 10 minutos, a rotina de lote será executada, para que as entradas passem por uma validação mais completa.  Além disso, com a intenção de saber definitivamente se tudo correu bem, recomenda-se que o pagador utilize o recurso /batch-transfers/ (GET)
  # @param body
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse201]
  def envia_transferencias_lote(body, opts = {})
    data, _status_code, _headers = envia_transferencias_lote_with_http_info(body, opts)
    data
  end

  # Request for transfers in batch
  # Pedido de transferências em lote de pagamento de qualquer tipo (fornecedores, salário ou diversos), por transferência bancária (incluindo outros bancos) ou por depósito judicial.  A solicitação será submetida a uma validação prévia das informações do pagador e das entradas inseridas na lista de pagamentos. Após 10 minutos, a rotina de lote será executada, para que as entradas passem por uma validação mais completa.  Além disso, com a intenção de saber definitivamente se tudo correu bem, recomenda-se que o pagador utilize o recurso /batch-transfers/ (GET)
  # @param body
  # @param [Hash] opts the optional parameters
  # @return [Array<(InlineResponse201, Integer, Hash)>] InlineResponse201 data, response status code and response headers
  def envia_transferencias_lote_with_http_info(body, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.envia_transferencias_lote ...'
    end
    # verify the required parameter 'body' is set
    if @api_client.config.client_side_validation && (body.nil? || !body.valid?)
      base_msg = "Invalid required parameter 'body' when calling TransfersApi.envia_transferencias_lote. "
      reason_msg = "Parameter missing" if body.nil?
      reason_msg = "#{body.list_invalid_properties}" if body.present?
      fail ArgumentError, "#{base_msg} #{reason_msg}"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.envia_transferencias_lote"
    end
    # resource path
    local_var_path = '/batch-transfers'

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

    return_type = opts[:return_type] || 'InlineResponse201'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#envia_transferencias_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
  # List of transfers in batch
  # Retorna uma lista de lotes de pagamentos.
  # @param start_date Data inicial de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param end_date Data final de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :payment_contract Contrato de pagamento entre o terceiro e o Banco do Brasil. Opcionalmente, quando não informado, será considerado o contrato vinculado à identificação interna do cliente.
  # @option opts [Integer] :debit_branch_office Código da agência para débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [Integer] :debit_current_account Conta corrente de débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [String] :check_digits_debit_current_account Dígito do verificador da conta corrente para débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [Integer] :payment_type A modalidade que representa o tipo de pagamento, descrita a seguir: 126 significa pagamento de fornecedores; 127 significa pagamento de salário; 128 significa pagamento diverso.
  # @option opts [Integer] :request_status Código do estado da requisição a ser pesquisada: 1 - Requisição com todos os lançamentos com dados consistentes;  2 - Requisição com ao menos um dos lançamentos com dados inconsistentes; 3 - Requisição com todos os lançamentos com dados inconsistentes;  4 - Requisição pendente de ação pelo Conveniado - falta autorizar o pagamento;  5 - Requisição em processamento pelo Banco;  6 - Requisição Processada;  7 - Requisição Rejeitada,  8 - Preparando remessa não liberada,  9 - Requisição liberada via API,  10 -  Preparando remessa liberada.   As situações 1, 2 e 8 são transitórias e não requerem qualquer ação do Cliente Conveniado. situação 3 sempre será migrada para situação 7.  A situação 4 Significa que, ao menos um lançamento, depende de ação do Cliente Conveniado, seja liberando ou cancelando os pagamentos.  As situações 5, 6, 7, 9 e 10 não requerem qualquer ação do Cliente Conveniado. A situação 5 significa que, ao menos um lançamento, está agendado.  As situações 6 e 7 são definitivas não havendo alteração posterior da situação da requisição.
  # @option opts [Integer] :index Posição do índice de paginação.  Indica a posição a partir da qual a pesquisa tratá os registros (ex: valor 0, indica que está trazendo a partir do registro 1, valor 300 indica que está trazendo a partir do 301). Cada resposta tem um limite de 300 ocorrências na lista paymentList, iniciada a partir do valor do índice fornecido. Para todas as ocorrências, itere sobre esse recurso usando o valor do campo nextIndex da resposta
  # @return [RootTypeForBatchTransferGETResponseObject]
  def lista_transferencias_lote(start_date, end_date, opts = {})
    data, _status_code, _headers = lista_transferencias_lote_with_http_info(start_date, end_date, opts)
    data
  end

  # List of transfers in batch
  # Retorna uma lista de lotes de pagamentos.
  # @param start_date Data inicial de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param end_date Data final de envio da requisição a ser pesquisada (formato: ddmmaaaa)
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :payment_contract Contrato de pagamento entre o terceiro e o Banco do Brasil. Opcionalmente, quando não informado, será considerado o contrato vinculado à identificação interna do cliente.
  # @option opts [Integer] :debit_branch_office Código da agência para débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [Integer] :debit_current_account Conta corrente de débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [String] :check_digits_debit_current_account Dígito do verificador da conta corrente para débito. Não é necessário quando a solicitação é acessada pelo código de autorização no fluxo do OAuth.
  # @option opts [Integer] :payment_type A modalidade que representa o tipo de pagamento, descrita a seguir: 126 significa pagamento de fornecedores; 127 significa pagamento de salário; 128 significa pagamento diverso.
  # @option opts [Integer] :request_status Código do estado da requisição a ser pesquisada: 1 - Requisição com todos os lançamentos com dados consistentes;  2 - Requisição com ao menos um dos lançamentos com dados inconsistentes; 3 - Requisição com todos os lançamentos com dados inconsistentes;  4 - Requisição pendente de ação pelo Conveniado - falta autorizar o pagamento;  5 - Requisição em processamento pelo Banco;  6 - Requisição Processada;  7 - Requisição Rejeitada,  8 - Preparando remessa não liberada,  9 - Requisição liberada via API,  10 -  Preparando remessa liberada.   As situações 1, 2 e 8 são transitórias e não requerem qualquer ação do Cliente Conveniado. situação 3 sempre será migrada para situação 7.  A situação 4 Significa que, ao menos um lançamento, depende de ação do Cliente Conveniado, seja liberando ou cancelando os pagamentos.  As situações 5, 6, 7, 9 e 10 não requerem qualquer ação do Cliente Conveniado. A situação 5 significa que, ao menos um lançamento, está agendado.  As situações 6 e 7 são definitivas não havendo alteração posterior da situação da requisição.
  # @option opts [Integer] :index Posição do índice de paginação.  Indica a posição a partir da qual a pesquisa tratá os registros (ex: valor 0, indica que está trazendo a partir do registro 1, valor 300 indica que está trazendo a partir do 301). Cada resposta tem um limite de 300 ocorrências na lista paymentList, iniciada a partir do valor do índice fornecido. Para todas as ocorrências, itere sobre esse recurso usando o valor do campo nextIndex da resposta
  # @return [Array<(RootTypeForBatchTransferGETResponseObject, Integer, Hash)>] RootTypeForBatchTransferGETResponseObject data, response status code and response headers
  def lista_transferencias_lote_with_http_info(start_date, end_date, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.lista_transferencias_lote ...'
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.lista_transferencias_lote"
    end
    # verify the required parameter 'start_date' is set
    if @api_client.config.client_side_validation && start_date.nil?
      fail ArgumentError, "Missing the required parameter 'start_date' when calling TransfersApi.lista_transferencias_lote"
    end
    # verify the required parameter 'end_date' is set
    if @api_client.config.client_side_validation && end_date.nil?
      fail ArgumentError, "Missing the required parameter 'end_date' when calling TransfersApi.lista_transferencias_lote"
    end
    # resource path
    local_var_path = '/batch-transfers'

    # query parameters
    query_params = opts[:query_params] || {}
    query_params[@api_client.config.app_key_name.to_sym] = gw_app_key
    query_params[:'startDate'] = start_date
    query_params[:'endDate'] = end_date
    query_params[:'paymentContract'] = opts[:'payment_contract'] if !opts[:'payment_contract'].nil?
    query_params[:'debitBranchOffice'] = opts[:'debit_branch_office'] if !opts[:'debit_branch_office'].nil?
    query_params[:'debitCurrentAccount'] = opts[:'debit_current_account'] if !opts[:'debit_current_account'].nil?
    query_params[:'checkDigitsDebitCurrentAccount'] = opts[:'check_digits_debit_current_account'] if !opts[:'check_digits_debit_current_account'].nil?
    query_params[:'paymentType'] = opts[:'payment_type'] if !opts[:'payment_type'].nil?
    query_params[:'requestStatus'] = opts[:'request_status'] if !opts[:'request_status'].nil?
    query_params[:'index'] = opts[:'index'] if !opts[:'index'].nil?

    # header parameters
    header_params = opts[:header_params] || {}
    # HTTP header 'Accept' (if needed)
    header_params['Accept'] = @api_client.select_header_accept(['application/json'])

    # form parameters
    form_params = opts[:form_params] || {}

    # http body (model)
    post_body = opts[:body]

    return_type = opts[:return_type] || 'RootTypeForBatchTransferGETResponseObject'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#lista_transferencias_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
  # Checks a transfers in batch request
  # Verifica se a requisição ao recurso Transfers in Batch foi bem-sucedida ao se registrar no sistema de pagamento do Banco do Brasil.  O requestresource (Transfers in Batch) faz uma validação referente ao solicitante do pagamento e às entradasfornecidas na requisição. Após 10 minutos, quando a rotina em lote é executada, o cliente deve verificar o resultado para ver se algum outro ponto de inconsistência foi encontrado. Além disso, após a data de pagamento informada, o cliente deve consultar novamente a solicitação de pagamento para saber definitivamente se tudo correu bem.
  # @param id Identificador da requisição de pagamento. Número único, não sequencial, controlado pelo cliente, com domínio entre 1 e 999999999.
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2002]
  def sondagem_transferencia_lote(id, opts = {})
    data, _status_code, _headers = sondagem_transferencia_lote_with_http_info(id, opts)
    data
  end

  # Checks a transfers in batch request
  # Verifica se a requisição ao recurso Transfers in Batch foi bem-sucedida ao se registrar no sistema de pagamento do Banco do Brasil.  O requestresource (Transfers in Batch) faz uma validação referente ao solicitante do pagamento e às entradasfornecidas na requisição. Após 10 minutos, quando a rotina em lote é executada, o cliente deve verificar o resultado para ver se algum outro ponto de inconsistência foi encontrado. Além disso, após a data de pagamento informada, o cliente deve consultar novamente a solicitação de pagamento para saber definitivamente se tudo correu bem.
  # @param id Identificador da requisição de pagamento. Número único, não sequencial, controlado pelo cliente, com domínio entre 1 e 999999999.
  # @param [Hash] opts the optional parameters
  # @return [Array<(InlineResponse2002, Integer, Hash)>] InlineResponse2002 data, response status code and response headers
  def sondagem_transferencia_lote_with_http_info(id, opts = {})
    if @api_client.config.debugging
      @api_client.config.logger.debug 'Calling API: TransfersApi.sondagem_transferencia_lote ...'
    end
    # verify the required parameter 'id' is set
    if @api_client.config.client_side_validation && id.nil?
      fail ArgumentError, "Missing the required parameter 'id' when calling TransfersApi.sondagem_transferencia_lote"
    end
    # verify the required parameter 'gw_app_key' is set
    if @api_client.config.client_side_validation && gw_app_key.nil?
      fail ArgumentError, "Missing the required parameter 'gw_app_key' when calling TransfersApi.sondagem_transferencia_lote"
    end
    # resource path
    local_var_path = '/batch-transfers/{id}/check'.sub('{' + 'id' + '}', id.to_s)

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

    return_type = opts[:return_type] || 'InlineResponse2002'

    auth_names = opts[:auth_names] || ['OAuth2-CC']
    data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                      :header_params => header_params,
                                                      :query_params => query_params,
                                                      :form_params => form_params,
                                                      :body => post_body,
                                                      :auth_names => auth_names,
                                                      :return_type => return_type)

    if @api_client.config.debugging
      @api_client.config.logger.debug "API called: TransfersApi#sondagem_transferencia_lote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
    end
    return data, status_code, headers
  end
end
