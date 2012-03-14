# -*- coding: utf-8 -*-
$:.unshift File.join(File.dirname(__FILE__), "vendor")

require 'qwik/wabisabi-format-xml'
require 'qwik/parser'

module QwikDoc
  VERSION = "0.0.1"

  def to_xhtml(src)
    Qwik::TextParser.make_tree(Qwik::TextTokenizer.tokenize(src)).rb_format_xml
  end
  module_function :to_xhtml
end
