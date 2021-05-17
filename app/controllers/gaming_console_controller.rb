class GamingConsoleController < ApplicationController
  def index
    if params[:manufacturer].present?
      @gameConsoles = GamingConsole.where(:manufacturer => params[:manufacturer])
    else
      @gameConsoles = GamingConsole.all
    end

    render(json: {'gamingConsoles' => @gameConsoles.map(&:name)})
  end
end
