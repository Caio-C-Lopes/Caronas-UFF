module ApplicationHelper

	def br_date_time(us_date_time, type)
		return us_date_time.strftime("%d/%m/%Y") if type == 'date'
		return us_date_time.strftime("%H:%M") if type == 'time'
		us_date_time.strftime("%d/%m/%Y - %H:%M")
	end

end
