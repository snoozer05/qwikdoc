# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

require 'pp'

$LOAD_PATH.unshift '..' unless $LOAD_PATH.include? '..'
require 'qwik/config'
require 'qwik/htree-to-wabisabi'
require 'qwik/util-pathname'

module Qwik
  class TemplateGenerator
    def self.main(args)
=begin
      config = Config.new
      Config.load_args_and_config(config, $0, args)
      path = config.template_dir.path
      generate_all(path)
=end
      generate_all(".")
    end

    def self.generate_all(path)
      Pathname.glob(path+'*.html') {|file|
	basename = file.basename('.html').to_s
	make(path, basename)
      }
    end

    def self.make(path, basename)
      outfile = path+"#{basename}.rb"
      file = path+"#{basename}.html"

      in_mtime  = file.mtime
      out_mtime = outfile.exist? ? outfile.mtime : Time.at(0)
      return unless out_mtime < in_mtime

      puts "generate #{basename}" unless $test

      html = file.read
      w = generate_template(html)

      src = ''
      PP.pp(w, src)	# inspect with pretty print.

      str =
"# This file is automatically generated.
# DO NOT EDIT THIS FILE.

module Qwik
  class Template
    def self.generate_#{basename}
      return #{src}
    end
  end
end
"
      outfile.put(str)
    end

    def self.generate_template(html)
      html = html.map {|line| line.strip }.join
      return HTree(html).to_wabisabi
    end

  end
end

if $0 == __FILE__
  if ARGV[0] == '--generate'
    ARGV.shift
    Qwik::TemplateGenerator.main(ARGV)
  else
    require 'qwik/testunit'
    require 'qwik/config'
    $test = true
  end
end

if defined?($test) && $test
  class TestTemplateGenerator < Test::Unit::TestCase
    def test_generate_template
      config = defined?($test_config) ? $test_config : Qwik::Config.new
      path = config.template_dir.path

      # test_generate_template
      html =
'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:v="urn:schemas-microsoft-com:vml">
  <head id="header"></head>
  <body onload="qwik_onload();" ondblclick="wema_dblClick(this);" ondragdrop="qwik_dragdrop(this);">
    <div class="container">
      <div class="main">
        <div class="adminmenu" id="adminmenu"></div><!--adminmenu-->
        <div class="toc" id="toc"></div><!--toc-->
        <h1 id="view_title"></h1>
        <div id="body_enter"></div><!--id:body_enter-->
        <div id="body"></div><!--id:body-->
        <div id="body_leave"></div><!--id:body_leave-->
      </div><!--main-->
      <div class="sidebar" id="sidemenu"></div><!--sidebar-->
      <div class="footer" id="footer"></div><!--footer-->
    </div><!--container-->
  </body>
</html>'
      w = [[:"!DOCTYPE", 'html', 'PUBLIC',
	  '-//W3C//DTD HTML 4.01 Transitional//EN',
	  'http://www.w3.org/TR/html4/loose.dtd'],
	[:html,
	  [:head, {:id=>'header'}],
	  [:body, {:ondragdrop=>"qwik_dragdrop(this);",
	      :onload=>"qwik_onload();", :ondblclick=>"wema_dblClick(this);"},
	    [:div, {:class=>'container'},
	      [:div, {:class=>'main'},
		[:div, {:id=>'adminmenu', :class=>'adminmenu'}],
		[:"!--", 'adminmenu'],
		[:div, {:id=>'toc', :class=>'toc'}], [:"!--", 'toc'],
		[:h1, {:id=>'view_title'}],
		[:div, {:id=>'body_enter'}], [:"!--", 'id:body_enter'],
		[:div, {:id=>'body'}], [:"!--", 'id:body'],
		[:div, {:id=>'body_leave'}], [:"!--", 'id:body_leave']],
	      [:"!--", 'main'],
	      [:div, {:id=>'sidemenu', :class=>'sidebar'}], [:"!--", 'sidebar'],
	      [:div, {:id=>'footer', :class=>'footer'}], [:"!--", 'footer']],
	    [:"!--", 'container']]]]
      ok_eq(w, Qwik::TemplateGenerator.generate_template(html))

      # test_generate_all
      Qwik::TemplateGenerator.generate_all(path)
    end
  end

  class CheckPP < Test::Unit::TestCase
    def test_pp
      w = [:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,
	[:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb,
	  [:cccccccccccccccccccccccccccccc,
	    [:dddddddddddddddddddddddddddddd]]]]

      str = ''
      PP.pp(w, str)
      ok_eq("[:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,
 [:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb,
  [:cccccccccccccccccccccccccccccc, [:dddddddddddddddddddddddddddddd]]]]
", str)
    end
  end
end
