module ApplicationHelper

    include Pagy::Frontend

    def letter_options
        $letter_options_list ||= ['#'].concat(("A".."Z").to_a)
    end

    def thumb_image_tag(section_url)
        if section_url != ""
            image_tag(section_url, class: "img-responsive")
        end
    end

    def film_information(film)
        rtn = []
        if film.runtime.present?
            rtn.append(film.runtime)
        end
        rtn.append(formats(film))
        if film.country.present?
            rtn.append(film.country)
        end
        rtn.join(' | ')
    end

    def film_release(film)
        rtn = ""
        if film.release_year.present?
            rtn = "<small class='text-muted'>(#{film.release_year})</small>".html_safe 
        end
    end
end
