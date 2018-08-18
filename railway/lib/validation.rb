module Validation
  module ClassMethods
    attr_reader :vld_storage

    def validate(name, type_valid, param = nil)
      @vld_storage ||= []
      @vld_storage << { attr: name, type_valid: type_valid, param: param }

      define_method(:validate!) do
        self.class.vld_storage.each do |item|
          var_name = "@#{item[:attr]}".to_sym
          value = instance_variable_get(var_name)
          name_validation = ('validate_' + item[:type_valid].to_s).to_sym
          self.class.send(name_validation, item[:attr], value, item[:param])
        end
        true
      end
    end

    protected

    attr_writer :vld_storage

    def validate_presence(name, value, _param)
      raise "#{name} can't be nil." if value.nil?
      raise "#{name} can't be empty line." if value.to_s.empty?
    end

    def validate_format(name, value, format_val)
      raise "#{name} has invalid format." if value !~ format_val
    end

    def validate_type(name, value, type_val)
      raise "#Type of #{name} must be #{type_val}" unless value.is_a? type_val
    end

    def validate_each_type(name, value, type_val)
      all_correspond = value.all? { |item| item.is_a? type_val }
      raise "#All values of #{name} must be #{type_val}" unless all_correspond
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue StandardError
      false
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
