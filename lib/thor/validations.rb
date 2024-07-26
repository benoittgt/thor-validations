# frozen_string_literal: true

require 'thor'
require_relative 'validations/version'

module Thor
  module Validations
    def self.included(base)
      base.extend(ClassMethods)
      base.prepend(InstanceMethods)
    end

    module ClassMethods
      def validations
        @validations ||= {}
      end

      def validate_before(*method_names, &validation)
        method_names.each do |method_name|
          validations[method_name.to_sym] ||= []
          validations[method_name.to_sym] << validation
        end
      end
    end

    module InstanceMethods
      def invoke_command(command, *args)
        run_validations(command)
        super
      end

      private

      def run_validations(command)
        return unless command && self.class.validations.key?(command.name.to_sym)

        self.class.validations[command.name.to_sym].each do |validation|
          result = instance_exec(&validation)
          raise Thor::Error, "Validation failed for #{command.name}" unless result
        end
      end
    end
  end
end

