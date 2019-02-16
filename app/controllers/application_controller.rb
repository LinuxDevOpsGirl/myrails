class ApplicationController < ActionController::Base
    include Pagy::Backend
    require 'net/http'
    require 'json'
    
    filter_resource_access

    helper_method :current_user_session, :current_user, :get_thumbnail, :get_autoplay_url

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def get_autoplay_url(section_url)
        if section_url.include? "http://player.vimeo.com/"
            regexclip_id = Regexp.new(/player.vimeo.com\/video\/([0-9]*)/)
            matchclip_iddata = regexclip_id.match(section_url)
            video_id = matchclip_iddata[1]
            rtn = "https://player.vimeo.com/video/#{video_id}"
        elsif section_url.include? "www.youtube.com/embed"
            regexclip_id = Regexp.new(/www.youtube.com\/embed\/([\w]*)/)
            matchclip_iddata = regexclip_id.match(section_url)
            video_id = matchclip_iddata[1]
            rtn = "https://www.youtube.com/embed/#{video_id}"
        elsif section_url.include? "www.youtube.com/v"
            regexclip_id = Regexp.new(/www.youtube.com\/v\/([\w]*)/)
            matchclip_iddata = regexclip_id.match(section_url)
            video_id = matchclip_iddata[1]
            rtn = "https://www.youtube.com/embed/#{video_id}"
        end
    end
    

    # FIX make a regex caller method, bit lacking in DRY
    def get_thumbnail(section_url)
        thumbnail_url = "http://bmxmdb.com/images/film_preview.png"
        if section_url.nil?
        else
            if section_url.include? "http://player.vimeo.com/"
                regexclip_id = Regexp.new(/player.vimeo.com\/video\/([0-9]*)/)
                matchclip_iddata = regexclip_id.match(section_url)
                video_id = matchclip_iddata[1]
                url = "https://vimeo.com/api/oembed.json?url=https://vimeo.com/#{video_id}"
                uri = URI(url)
                response = Net::HTTP.get(uri)
                begin
                    data = JSON.parse(response)

                    if data["thumbnail_width"].to_i > 459
                        thumbnail_url =  data["thumbnail_url"]
                    else
                        t_regexclip_id = Regexp.new(/video\/([0-9]*)/)
                        t_matchclip_iddata = t_regexclip_id.match(data["thumbnail_url"])
                        t_video_id = t_matchclip_iddata[1]
                        thumbnail_url = "https://i.vimeocdn.com/video/#{t_video_id}_460.jpg"
                    end
                rescue JSON::ParserError
                    thumbnail_url =  "http://bmxmdb.com/images/film_preview.png" #blank image I imagine
                end
                
            elsif section_url.include? "www.youtube.com/embed"
                regexclip_id = Regexp.new(/www.youtube.com\/embed\/([\w]*)/)
                matchclip_iddata = regexclip_id.match(section_url)
                video_id = matchclip_iddata[1]
                thumbnail_url = "https://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
            elsif section_url.include? "www.youtube.com/v"
                regexclip_id = Regexp.new(/www.youtube.com\/v\/([\w]*)/)
                matchclip_iddata = regexclip_id.match(section_url)
                video_id = matchclip_iddata[1]
                thumbnail_url = "https://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
            end
        end
        return thumbnail_url
    end


end
