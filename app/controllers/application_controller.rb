class ApplicationController < ActionController::Base
  before_action :mem

  private
  def mem
    puts GetProcessMem.new.inspect
  end
end
