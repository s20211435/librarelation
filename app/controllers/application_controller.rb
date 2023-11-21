class ApplicationController < ActionController::Base

    private

    def bacis_authenticate
        authenticate_or_request_with_http_basic do |user, pass|
            user == "b" && pass == "a"
        end
    end


end
