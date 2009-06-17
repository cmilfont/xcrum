ActiveRecord::Serialization::Serializer.class_eval do
      def add_includes_with_nested_include(&block)
        if include_associations = options.delete(:include)
          base_only_or_except = { :except => options[:except],
                                  :only => options[:only] }

          include_has_options = include_associations.is_a?(Hash)
          associations = include_has_options ?
include_associations.keys : Array(include_associations)

          for association in associations
            association_has_options = association.is_a?(Hash)
            if association_has_options
              macro_association = association.keys.first
              additional_association_options = association
[macro_association]
            else
              additional_association_options = {}
              macro_association = association
            end
            macro = @record.class.reflect_on_association
(macro_association).macro
            records = case macro
            when :has_many, :has_and_belongs_to_many
              @record.send(macro_association).to_a
            when :has_one, :belongs_to
              @record.send(macro_association)
            end
            unless records.nil?
              association_options = include_has_options ?
include_associations[macro_association] : base_only_or_except
              opts = options.merge(association_options).merge
(additional_association_options)
              yield(macro_association, records, opts)
            end
          end

          options[:include] = include_associations
        end
      end
      alias_method_chain :add_includes, :nested_include
end