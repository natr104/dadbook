module OutingsHelper

    def outing_date_time(outing)
        date_time = outing.outing_date.strftime('%A, %d %b %Y at %l:%M %p')
    end

end
