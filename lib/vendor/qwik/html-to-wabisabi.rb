# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

$LOAD_PATH << 'compat' unless $LOAD_PATH.include? 'compat'
require 'htree'

$LOAD_PATH.unshift '..' unless $LOAD_PATH.include? '..'
require 'qwik/htree-to-wabisabi'
require 'qwik/wabisabi-template'
require 'qwik/util-string'

module Qwik
  class HtmlToWabisabi
    def self.parse(str)
      html = "<html>"+str+"</html>"
      html = html.normalize_newline

      htree = HTree(html)
      first_child = htree.children[0]
      wabisabi = first_child.to_wabisabi
      wabisabi = wabisabi.inside
      return wabisabi
    end
  end
end

if $0 == __FILE__
  require 'qwik/testunit'
  $test = true
end

if defined?($test) && $test
  class TestHtmlToWabisabi < Test::Unit::TestCase
    def ok(e, s)
      ok_eq(e, Qwik::HtmlToWabisabi.parse(s))
    end

    def test_ref
      #ok(["\240"], "&nbsp;")
      #ok(["?"], "&nbsp;")
      ok(["<"], "&lt;")
      ok([">"], "&gt;")
    end

    def test_html_parser
      ok([], '')
      ok(['a'], 'a')

      # Div element can contain another div element.
      ok([[:div, 't1', [:div, 't2']]], "<div>t1<div>t2")

      # Span element can not contain div element.
      ok([[:span, 't1'], [:div, 't2']], "<span>t1<div>t2")

      # Fix the order.
      ok([[:b, [:i, 't']]], "<b><i>t</i></b>")

      # You can use incomplete html also.
      ok([[:ul, [:li, 't1'], [:li, 't2']]], "<ul><li>t1<li>t2")

      # test_long_html
      html = <<'EOT'
<H2>�����ꗗ�ȈՔ�</H2>
<P>�ڍׂȐ�����<A href="TextFormat.html">TextFormat</A>������񂭂������B</P>
<H3>���o��2</H3>
<H4>���o��3</H4>
<H5>���o��4</H5>
<H6>���o��5</H6>
<UL>
<LI>�ӏ������x��1
<UL>
<LI>�ӏ������x��2
<UL>
<LI>�ӏ������x��3</LI></UL></LI></UL></LI></UL>
<OL>
<LI>�������X�g1
<OL>
<LI>�������X�g2
<OL>
<LI>�������X�g3</LI></OL></LI></OL></LI></OL><PRE>���`�ς݃e�L�X�g�B</PRE>
<BLOCKQUOTE>
<P>���p�B</P></BLOCKQUOTE>
<DL>
<DT>Wiki
<DD>�������݉\��Web�y�[�W
<DT>QuickML
<DD>�ȒP�ɍ��郁�[�����O���X�g�V�X�e��</DD></DL>
<TABLE>
<TBODY>
<TR>
<TD>����1-1</TD>
<TD>����1-2</TD>
<TD>����1-3</TD></TR>
<TR>
<TD>����2-1</TD>
<TD>����2-2</TD>
<TD>����2-3</TD></TR></TBODY></TABLE>
<P><EM>����</EM>�A<STRONG>����ɋ���</STRONG>�A<DEL>��������</DEL> <IMG alt=new src="http://example.com/.theme/new.png"> <A href="FrontPage.html">FrontPage</A> <A href="http://www.yahoo.co.jp/">Yahoo!</A></P><PLUGIN param='1' method='recent'></PLUGIN>
EOT

      result = [[:h2, "�����ꗗ�ȈՔ�"], "\n",
	[:p, "�ڍׂȐ�����",
	  [:a, {:href=>'TextFormat.html'}, 'TextFormat'],
	  "������񂭂������B"], "\n",
	[:h3, "���o��2"], "\n",
	[:h4, "���o��3"], "\n",
	[:h5, "���o��4"], "\n",
	[:h6, "���o��5"], "\n",
	[:ul,  "\n",
	  [:li,   "�ӏ������x��1\n",
	    [:ul,    "\n",
	      [:li, "�ӏ������x��2\n",
		[:ul, "\n", [:li, "�ӏ������x��3"]]]]]], "\n",
	[:ol,  "\n",
	  [:li,   "�������X�g1\n",
	    [:ol, "\n", [:li, "�������X�g2\n",
		[:ol, "\n", [:li, "�������X�g3"]]]]]],
	[:pre, "���`�ς݃e�L�X�g�B"], "\n",
	[:blockquote, "\n", [:p, "���p�B"]], "\n",
	[:dl, "\n",
	  [:dt, "Wiki\n"],
	  [:dd, '�������݉\��Web�y�[�W'+"\n"],
	  [:dt, "QuickML\n"],
	  [:dd, "�ȒP�ɍ��郁�[�����O���X�g�V�X�e��"]], "\n",
	[:table, "\n",
	  [:tbody, "\n",
	    [:tr, "\n",
	      [:td, "����1-1"], "\n",
	      [:td, "����1-2"], "\n",
	      [:td, "����1-3"]], "\n",
	    [:tr, "\n",
	      [:td, "����2-1"], "\n",
	      [:td, "����2-2"], "\n",
	      [:td, "����2-3"]]]], "\n",
	[:p,
	  [:em, "����"],  "�A",
	  [:strong, "����ɋ���"],  "�A",
	  [:del, "��������"],  ' ',
	  [:img, {:alt=>'new', :src=>'http://example.com/.theme/new.png'}],  ' ',
	  [:a, {:href=>'FrontPage.html'}, 'FrontPage'],  ' ',
	  [:a, {:href=>'http://www.yahoo.co.jp/'}, "Yahoo!"]],
	[:plugin, {:method=>'recent', :param=>'1'}], "\n"]

      ok(result, html)
    end
  end
end
