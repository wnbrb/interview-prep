# https://www.codewars.com/kata/514a024011ea4fb54200004b

require 'uri'
#  https://docs.ruby-lang.org/en/2.1.0/URI.html

def domain_name(url)
    #  host would give you google.com if you had https://google.com/something/something
  URI.parse(format(url)).host.split(".").first
end

def format(url)
  #   Add the protocol
  url.prepend("http://") unless url.start_with?("http://","https://")

  #   What about other subdomains? This will not work with something.google.com
  return url.sub("www.", "") if url.start_with?("http://www","https://www")

  url
end

def domain_name2(url)
  url.match(/(https?:\/\/)(www.)?(.+)(\..+)/)[3]
end

def domain_name3(url)
  url.match(/(?<protocol>https?:\/\/)(?<subdomain>www.)?(?<domain>[a-zA-Z\-_0-9]+)./)[:domain]
end
# Tests
p domain_name1("http://github.com/carbonfive/raygun") == "github"
p domain_name1("http://www.zombie-bites.com") == "zombie-bites"
p domain_name1("https://www.cnet.com") == "cnet"
