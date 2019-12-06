require 'date'

input = File.readlines("4.input").map(&:chomp)

def parse_date(str)
  # [1518-06-07 00:03]
  DateTime.parse(str[1..16])
end

guard_map     = {}
on_duty_guard = nil
last_sleep    = nil

input.sort { |a, b| parse_date(a) <=> parse_date(b) }.each do |item|
  on_duty_guard  = $1 if item =~ /Guard #(\d+) begins shift/
  fell_asleep_at = $1 if item =~ /\[\d\d\d\d-\d\d-\d\d \d\d:(\d\d)\] falls asleep/
  woke_up_at     = $1 if item =~ /\[\d\d\d\d-\d\d-\d\d \d\d:(\d\d)\] wakes up/

  guard_map[on_duty_guard] ||= {}

  last_sleep = fell_asleep_at.to_i if fell_asleep_at

  next unless woke_up_at

  # # adjusting -1 b/c the woke up min is counted as woke
  (last_sleep..(woke_up_at.to_i - 1)).each do |min_asleep|
    guard_map[on_duty_guard][:total_mins_asleep] ||= 0
    guard_map[on_duty_guard][:total_mins_asleep] += 1
    guard_map[on_duty_guard][:mins_asleep] ||= {}
    guard_map[on_duty_guard][:mins_asleep][min_asleep] ||= 0
    guard_map[on_duty_guard][:mins_asleep][min_asleep] += 1
  end
end

# remove guards who did their job
guard_map.delete_if { |k, v| v[:total_mins_asleep].nil? }

puts (guard_map.max_by { |a| a[1][:total_mins_asleep] }[0].to_i * guard_map.max_by { |a| a[1][:total_mins_asleep] }[1][:mins_asleep].max_by { |k,v| v }[0].to_i) == 48680


# PART TWO

# I just eyeballed this.  Need to finish by programatically concluding: G_ID: # 2789 [34, 17] or 2789 * 34
guard_map.each do |guard_id, hash|
  puts "G_ID: #{guard_id} #{hash[:mins_asleep].max_by { |k,v| v }}"
end
