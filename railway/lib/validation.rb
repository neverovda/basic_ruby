module Validation
  module ClassMethods
    attr_reader :vld_storage

    def validate(name, type_valid, param = true)
      var_name = "@#{name}".to_sym
      init(var_name)
      @vld_storage[var_name][type_valid] = param
      make_method_validate
    end

    protected

    attr_writer :vld_storage

    def init(var_name)
      @vld_storage ||= {}
      @vld_storage[var_name] ||= { presence: false,
                                   format: false,
                                   type: false }
    end

    def make_method_validate
      define_method(:validate!) do
        self.class.vld_storage.each do |var_name, params|
          value = instance_variable_get(var_name)
          name = var_name.to_s.delete '@'
          self.class.send(:validate_presence, name, value, params)
          self.class.send(:validate_format, name, value, params)
          self.class.send(:validate_type, name, value, params)
        end
        true
      end
    end

    def validate_presence(name, value, params)
      return unless params[:presence]
      raise "#{name} can't be nil." if value.nil?
      raise "#{name} can't be empty line." if value.to_s.empty?
    end

    def validate_format(name, value, params)
      format_val = params[:format]
      return unless format_val
      raise "#{name} has invalid format." if value !~ format_val
    end

    def validate_type(name, value, params)
      type_val = params[:type]
      return unless type_val
      raise "#Type of #{name} must be #{type_val}" unless value.is_a? type_val
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
