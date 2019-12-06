# input = "284639-748759"

def multi_repeating_digits?(base)
  repeating_counts = Hash.new(0)

  while base.positive?
    rem      = base % 10
    base     = base / 10
    prev_rem = base % 10

    if prev_rem == rem
      repeating_counts[rem] += 1
    end
  end

  if repeating_counts.count > 1
    return repeating_counts.detect { |k, v| v > 1 } && !repeating_counts.detect { |k, v| v == 1 }
  else
    return repeating_counts.detect { |k, v| v > 1 }
  end
end

def repeating_digits?(base)
  good = false

  while base.positive?
    rem      = base % 10
    base     = base / 10
    prev_rem = base % 10

    if prev_rem == rem
      good = true
      break
    end
  end

  good
end

def desc_digits?(base)
  good = true

  while base.positive?
    rem      = base % 10
    base     = base / 10
    prev_rem = base % 10

    if prev_rem > rem
      good = false
      break
    end
  end

  good
end

passes = 0

(284639..748759).each do |i|
#[112233, 123444, 111122].each do |i|
  next unless repeating_digits?(i)
  next if multi_repeating_digits?(i)
  next unless desc_digits?(i)

  passes += 1
end

puts passes
