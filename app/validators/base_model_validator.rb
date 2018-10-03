# frozen_string_literal: true

BaseModelValidator = Dry::Validation.Schema do
  configure do
    option :record

    # def avatar_max_size
    #   res = 1 * (1024 ^ 2) # bytes
    #   puts "avatar_max_size: #{res}"
    #   res
    # end

    def unique?(attr_name, value)
      !record.class.where.not(id: record.id).where(attr_name.to_sym => value).exists?
    end

    def relation?(relation_model, relation_id)
      relation_model.where(id: relation_id).exists?
    end

    # def size_valid?(value)
    #   puts "size_valid?: #{value.size < avatar_max_size}"
    #   value.size < avatar_max_size
    # end

    # def new_record?(_value)
    #   puts "new_record?: #{record.new_record?}"
    #   record.new_record? 
    # end

    # def size_less?(max_size, value)
    #   # value.size in bytes and max_value in mb
    #   Rails.logger.info "fsize_less?(first): #{(record.new_record? || value.present?) && value.present?}"
    #   puts "fsize_less?(first): #{(record.new_record? || value.present?) && value.present?}"
    #   if (record.new_record? || value.present?) && value.present?
    #     (value.size / 1024) < (max_size * 1024)
    #   else
    #     false
    #   end
    # end

    def self.messages
      super.merge(
        en: {
          errors: {
            # size_less?: 'size_less_than_maximum',
            unique?: 'not_uniq',
            relation?: 'relation_model_not_found',
            scope_uniq?: 'not_uniq_scope',
            # file_present?: 'file_not_present'
          }
        }
      )
    end
  end
end
