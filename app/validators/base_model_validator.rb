# frozen_string_literal: true

BaseModelValidator = Dry::Validation.Schema do
  configure do
    # option :model # ActiveRecord model class in this case
    # option :params # params of this model
    option :record

    def unique?(attr_name, value)
      !record.class.where.not(id: record.id).where(attr_name.to_sym => value).exists?
    end

    def relation?(relation_model, relation_id)
      relation_model.where(id: relation_id).exists?
    end

    def self.messages
      super.merge(
        en: { 
          errors: { 
            unique?: 'not_uniq',
            relation?: 'relation_model_not_found',
            scope_uniq?: 'not_uniq_scope'
          } 
        }
      )
    end
  end
end
