# frozen_string_literal: true

module Adventofcode
  module Helpers
    def split_input_with_blank_line_delimeters(input)
      group_data = []
      idx        = 0

      input.each_with_index do |line|
        if line == ""
          idx += 1
          next
        end
        group_data[idx] ||= []
        group_data[idx] << line
      end

      group_data
    end
  end
end
