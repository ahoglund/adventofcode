# frozen_string_literal: true

module Helpers
  def paragraphs(input)
    input.split("\n\n")
  end

  def assert_equal(val, truth)
    if val == truth
      puts "PASS: #{val} == #{truth}"
    else
      raise("Expected #{val} to be equal to #{truth}")
    end
  end

  def refute_equal(val, truth)
    if val != truth
      puts "PASS: #{val} != #{truth}"
    else
      raise("Expected #{val} to not be equal to #{truth}")
    end
  end
end
