module SimpleRack
  def self.application
    "simple_rack"
  end

  def self.app
    lambda {|env|
      [200, {"Content-Type" => "text/plain"}, [Time.now.to_s, "\n"]]
    }
  end

  def self.dependencies
    [["sinatra", ">= 0.9.2"]]
  end

  def self.activate
    dependencies.each do |name,version|
      gem name, version
    end
  end
end

$:.unshift File.dirname(__FILE__)

require 'simple_rack/version'
