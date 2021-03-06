module Polymorpheus
  class InterfaceBuilder
    class Association

      include ActiveSupport::Inflector

      attr_reader :name,
                  :key

      def initialize(name)
        @name = name.to_s.downcase
        @key = "#{@name}_id"
      end

      # The association class may not be loaded at the time this object
      # is initialized, so we can't set it via an accessor in the initializer.
      def association_class
        @association_class ||= name.classify.constantize
      end

    end
  end
end
