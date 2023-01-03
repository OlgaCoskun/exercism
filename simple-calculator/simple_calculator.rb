class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if !first_operand.is_a?(Integer) || !second_operand.is_a?(Integer)
    raise UnsupportedOperation.new unless ALLOWED_OPERATIONS.include?(operation)

    return 'Division by zero is not allowed.' if ALLOWED_OPERATIONS.include?("/") && second_operand == 0
    return 'Division by zero is not allowed.' if ALLOWED_OPERATIONS.include?("*") && second_operand == 0 || first_operand == 0

    print_result(first_operand, second_operand, operation)
  end

  def self.print_result(first_operand, second_operand, operation)
    result = first_operand.public_send(operation.to_sym, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
