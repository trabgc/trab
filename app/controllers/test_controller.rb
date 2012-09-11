class TestController < ApplicationController
  
  def start
  end
  
  def start_test
    # pega o id do sistema passado por parametro e adiciona na sessão
    if session[:system].nil?
      @system = System.find(params[:system_id])
    end
    
    # se passado algum valor como parametro não é primeira vez que esta executando
    if !params[:value].nil?
      # pega a value passada como parametro e adiciona na lista de values na sessao
      values = session[:values].push(params[:value])
      
      # pega os ids das rules que estão na sessão
      rules_ids = session[:rules_ids]
      
      logger.info "rules_ids 0"
      logger.info rules_ids
      
      # retira das rules_ids da sessão os ids que não tem o novo parametro
      rules_ids = rules_ids.drop_while { |rule_id| Rule.find(rule_id).premises.where(:value_id => params[:value]).size == 0}
      
      logger.info "rules_ids 1"
      logger.info rules_ids
      
      # atualiza rules_ids da sessão
      session[:rules_ids] = rules_ids
      
      # passa para array rules os rules da sessão
      rules = rules_ids.collect { |rule_id| Rule.find(rule_id) }
      
      # retira da lista de rules as que não tem o novo valor
      # rules = rules.drop_while { |rule| rule.premises.where(:value_id => params[:value]).size == 0 }
      
      logger.info "rules"
      logger.info rules
      
      # se não tem mais nenhuma rule eh uma regra invalida
      if rules.size == 0
        render action: 'end'
      else
        # se o tamanho de valores na sessao for o tamanho de premisas de uma regra
        # quer dizer que chegou ao fim da regra
        if session[:values].size == rules.first.premises.size   
          @rule = rules.first
          render 'finish'
        # pega a primera regra e exibe a pergunta correspondente ao tamanho de values
        # existente na sessão
        else
          @premise = rules.first.premises[values.size]
          @variable = Variable.find(@premise.variable_id)
        end
      end
    # primeira vez que esta executando o sistema
    else
      # inicia as variaveis
      session[:values] = []
      session[:rules_ids] = []
      rules = []
      
      # pega a premise e variavel inicial do sistema que se deseja utilizar
      @premise = Premise.find(@system.premise_id)
      @variable = Variable.find(@premise.variable_id)
      
      # pega todas regras que condizem com a premise do sistema
      premises = Premise.where(:value_id => @premise.value_id)
      premises.each{ |premise|
        rule = premise.rule
        if !rule.nil?
          if !rule.system_id.nil?
            rules.push(rule)
          end
        end
      } 
      
      # armazena na sessao o id de todas as regras que condizem com a premise inicial do sistema
      session[:rules_ids] = rules.collect {|rule| rule.id }
      
      logger.info "rules_ids"
      logger.info session[:rules_ids]
           
    end

  end
end
