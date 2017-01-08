module MappedDelegation
  extend ActiveSupport::Concern

  included do
    cattr_reader :delegation_mappings
    @@delegation_mappings ||= {}

    def self.delegate_with_mappings(*methods)
      delegate_without_mappings(*methods)

      options = methods.pop
      prefix, to = options.values_at(:prefix, :to)
      method_prefix = \
        if prefix
          "#{prefix == true ? to : prefix}_"
        else
          ''
        end

      methods.each do |method|
        @@delegation_mappings["#{method_prefix}#{method}"] = to
      end
    end

    self.class_eval do
      class << self
        alias_method_chain :delegate, :mappings
      end
    end
  end
end
