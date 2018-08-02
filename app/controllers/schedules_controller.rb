class SchedulesController < ApplicationController

 def index
      signed_check
 end

    def signed_check
     if signed_in?
      else
       redirect_to root_url
     end
    end
end
