# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

$LOAD_PATH.unshift '..' unless $LOAD_PATH.include? '..'
require 'qwik/html-to-wabisabi'

module Qwik
  class Action
    D_PluginEmbedHtml = {
      :dt => 'Embed HTML plugin',
      :dd => 'You can embed bare HTML in the page.',
      :dc => "* Example
 {{html
 This is <font color='red'>red</font>.
 }}
{{html
This is <font color='red'>red</font>.
}}
* Allowed elements
You can input allowed elements only.
** valid tags
#{WabisabiValidator::VALID_TAGS.join(' ')}
** valid attributes
#{WabisabiValidator::VALID_ATTR.join(' ')}

* HTML�̒��ւ̃v���O�C���̖��ߍ���
You can also embed plugins like this.
 {{html
 <plugin param=\"1\" method=\"recent\"></plugin>
 }}
{{html
<plugin param=\"1\" method=\"recent\"></plugin>
}}

* Example
<html>
<H3>Header 2</H3>
<H4>Header 3</H4>
<H5>Header 4</H5>
<H6>Header 5</H6>
<UL>
<LI>List 1
<UL>
<LI>List 2
<UL>
<LI>List 3</LI></UL></LI></UL></LI></UL>
<OL>
<LI>Ordered List 1
<OL>
<LI>Ordered List 2
<OL>
<LI>Ordered List 3</LI></OL></LI></OL></LI></OL>
<PRE>Pre-formatted text.</PRE>
<BLOCKQUOTE>
<P>This is a quoted text.</P>
</BLOCKQUOTE>
<DL>
<DT>Wiki
<DD>A writable Web system.
<DT>QuickML
<DD>An easy-to-use mailing list management system.</DD></DL>
<TABLE>
<TBODY>
<TR>
<TD>Table 1-1</TD>
<TD>Table 1-2</TD>
<TD>Table 1-3</TD></TR>
<TR>
<TD>Table 2-1</TD>
<TD>Table 2-2</TD>
<TD>Table 2-3</TD></TR></TBODY></TABLE>
<P><EM>Emphasis</EM>�A
<STRONG>Strong</STRONG>�A
<DEL>Delete</DEL>
<A href=\"http://qwik.jp/.theme/new.png\">new</A>
<A href=\"FrontPage.html\">FrontPage</A>
<A href=\"http://www.yahoo.co.jp/\">Yahoo!</A>
</P>

<PLUGIN param=\"1\" method=\"recent\"></PLUGIN>
</html>
"
    }

    D_PluginEmbedHtml_ja = {
      :dt => 'HTML���ߍ��݋@�\ ',
      :dd => 'HTML�����̂܂ܖ����ނ��Ƃ��ł��܂��B',
      :dc => "* ��
 {{html
 This is <font color='red'>red</font>.
 }}
{{html
This is <font color='red'>red</font>.
}}
* �g����v�f
�C�ӂ̃^�O���g����킯�ł͂Ȃ��C�g����v�f�͌����Ă��܂��D
** �g����^�O
#{WabisabiValidator::VALID_TAGS.join(' ')}
** �g����A�g���r���[�g
#{WabisabiValidator::VALID_ATTR.join(' ')}

* HTML�̒��ւ̃v���O�C���̖��ߍ���
HTML�L�q�̒���qwikWeb�̃v���O�C���𖄍��ނ��Ƃ��ł��܂��B
 {{html
 <plugin param=\"1\" method=\"recent\"></plugin>
 }}
{{html
<plugin param=\"1\" method=\"recent\"></plugin>
}}

* ��
<html>
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
<P><EM>����</EM>�A<STRONG>����ɋ���</STRONG>�A<DEL>��������</DEL> <A href=\"http://qwik.jp/.theme/new.png\">new</A> <A href=\"FrontPage.html\">FrontPage</A> <A href=\"http://www.yahoo.co.jp/\">Yahoo!</A></P>

<PLUGIN param=\"1\" method=\"recent\"></PLUGIN>
</html>
"
    }

    def plg_html
      return unless block_given?
      str = yield

      wabisabi = HtmlToWabisabi.parse(str)

      v = WabisabiValidator.valid?(wabisabi)
      if v == true
	return wabisabi
      else
	return "can not use [#{v}]"
      end
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActEmbedHtml < Test::Unit::TestCase
    include TestSession

    def test_all
      ok_wi(['a
'], '{{html
a
}}')

      # div can contain another div
      ok_wi([:div, 't1', [:div, 't2
']],
	    '{{html
<div>t1<div>t2
}}')

      # span can not contain div
      ok_wi([[:span, 't1'], [:div, 't2
']],
	    '{{html
<span>t1<div>t2
}}')

      # fix the order
      ok_wi([[:b, [:i, 't']], '
'],
	    '{{html
<b><i>t</i></b>
}}')

      # incomplete html maybe ok.
      ok_wi([:ul, [:li, 't1'], [:li, 't2
']],
	    '{{html
<ul><li>t1<li>t2
}}')

      # test_longer_html
      html = <<"EOT"
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
<P><EM>����</EM>�A<STRONG>����ɋ���</STRONG>�A<DEL>��������</DEL> <IMG alt=new src="http://example.com/.theme/new.png"> <A href="FrontPage.html">FrontPage</A> <A href="http://www.yahoo.co.jp/">Yahoo!</A></P><PLUGIN param="1" method="recent"></PLUGIN>
EOT

      result = <<"EOT"

<p>�ڍׂȐ�����<a href="TextFormat.html">TextFormat</a>������񂭂������B</p>
<h3>���o��2</h3>
<h4>���o��3</h4>
<h5>���o��4</h5>
<h6>���o��5</h6>
<ul>
<li>�ӏ������x��1
<ul>
<li>�ӏ������x��2
<ul>
<li>�ӏ������x��3</li></ul></li></ul></li></ul>
<ol>
<li>�������X�g1
<ol>
<li>�������X�g2
<ol>
<li>�������X�g3</li></ol></li></ol></li></ol><pre>���`�ς݃e�L�X�g�B</pre>
<blockquote>
<p>���p�B</p></blockquote>
<dl>
<dt>Wiki
</dt><dd>�������݉\��Web�y�[�W
</dd><dt>QuickML
</dt><dd>�ȒP�ɍ��郁�[�����O���X�g�V�X�e��</dd></dl>
<table>
<tbody>
<tr>
<td>����1-1</td>
<td>����1-2</td>
<td>����1-3</td></tr>
<tr>
<td>����2-1</td>
<td>����2-2</td>
<td>����2-3</td></tr></tbody></table>
<p><em>����</em>�A<strong>����ɋ���</strong>�A<del>��������</del> <img alt="new" src="http://example.com/.theme/new.png"/> <a href="FrontPage.html">FrontPage</a> <a href="http://www.yahoo.co.jp/">Yahoo!</a></p><plugin method="recent" param="1"/>
EOT
      ok_wi(result, '{{html
'+html+'
}}')
    end
  end
end
