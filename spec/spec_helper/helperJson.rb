module JsonHelper
  def jsonParse
    JSON.parse(response.body)
  end
end
