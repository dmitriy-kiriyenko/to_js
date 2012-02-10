require 'visitor'

module ToJs
  class Visitor < Visitor::Base
    add_accept_method! :to_js

    visitor_for String do |string|
      if string =~ /`([^`]+)`/
        $1
      else
        "\"#{string}\""
      end
    end

    visitor_for Numeric do |number|
      number.to_s
    end

    visitor_for NilClass do |_|
      'undefined'
    end

    visitor_for Enumerable do |array|
      "[#{array.map {|o| visit o}.join(", ")}]"
    end

    visitor_for Hash do |hash|
      "{#{hash.to_a.map{|key, value| "#{key}: #{visit value}"}.join(', ')}}"
    end

    visitor_for Object do |o|
      o.to_s
    end

  end
end
