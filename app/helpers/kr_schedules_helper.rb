module KrSchedulesHelper

  def calendar_range
    
    n = 0
    10.times do |i|
      date_cd = (Date.today - i).strftime("%u")
      n = i
      puts date_cd, (Date.today - i)
      break if date_cd == "7"
    end
    
    return [n+7, n - 13]
  end
  
  def calendar_array
    ary = Array.new
    
    calendar_start_date = Date.today - calendar_range[0]
    calendar_end_date   = Date.today - calendar_range[1]
    calendar_start_date.upto(calendar_end_date) do |date|
      ary << date
    end
    
    return ary
  end
end
