module ApplicationHelper

    def thumb_image_tag(section_url)
        if section_url != ""
            image_tag(section_url)
        end
    end
    
end
