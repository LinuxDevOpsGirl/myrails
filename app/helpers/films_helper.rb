module FilmsHelper
    # moved to application_helper, here for illustration purposes
    # def letter_options
    #     $letter_options_list ||= ['#'].concat(("A".."Z").to_a)
    # end

    # don't think this is the best way, maybe array of link_to, so I can apply styles dynamically
    def year_options
         link_to('Unknown', :type => 'year', :active_tab => 'years') + 
         link_to('1980-1989', :type => 'year', :start => 1980, :end => 1989, :active_tab => 'years') + 
         link_to('1990-1999', :type => 'year', :start => 1990, :end => 1999, :active_tab => 'years') + 
	     link_to('2000-2009', :type => 'year', :start => 2000, :end => 2009, :active_tab => 'years') + 
	     link_to('2010-', :type => 'year', :start => 2010, :end => 2100, :active_tab => 'years')
    end

    def formats(film)
        rtn = []
        if film.format_vhs
            rtn.push("VHS")
        end
        if film.format_dvd
            rtn.push("DVD")
        end
        if film.format_web 
            rtn.push("Web")
        end
        if film.format_blu
            rtn.push("Blu Ray")
        end
        rtn.join(', ')
    end
end