module ApplicationHelper

    include Pagy::Frontend

    def letter_options
        $letter_options_list ||= ['#'].concat(("A".."Z").to_a)
    end

    def thumb_image_tag(section_url)
        if section_url != ""
            image_tag(section_url)
        end
    end

end
