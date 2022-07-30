# frozen_string_literal: true

# ========first answer without digits method
def square_digits(num)
  num.to_s.split(//).map { |val| val.to_i * val.to_i }.join.to_i
end

# ==========Test case=================
