# frozen_string_literal: true

BaseModelValidator = Dry::Validation.Schema do
  configure do

    option :record

    def unique?(attr_name, value)
      !record.class.where.not(id: record.id).where(attr_name.to_sym => value).exists?
    end

    def relation?(relation_model, relation_id)
      relation_model.where(id: relation_id).exists?
    end

    def size_less?(max_size, value)
      # value.size in bytes and max_value in mb
      value.size/1024 < max_size*1024
    end

    def self.messages
      super.merge(
        en: { 
          errors: { 
            size_less?: 'size_less_than_maximum',
            unique?: 'not_uniq',
            relation?: 'relation_model_not_found',
            scope_uniq?: 'not_uniq_scope'
          } 
        }
      )
    end
  end
end
