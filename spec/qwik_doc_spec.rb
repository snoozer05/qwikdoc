require File.join(File.dirname(__FILE__), "spec_helper")
require 'qwik_doc'

describe QwikDoc do
  describe "Qwik::WikiFormat" do
    def compile(src)
      QwikDoc.to_xhtml(src)
    end

    describe "header" do
      describe "* t" do
        subject { compile("* t") }
        it { should == "<h2\n>t</h2\n>" }
      end

      describe "** t" do
        subject { compile("** t") }
        it { should == "<h3\n>t</h3\n>" }
      end

      describe "*** t" do
        subject { compile("*** t") }
        it { should == "<h4\n>t</h4\n>" }
      end

      describe "**** t" do
        subject { compile("**** t") }
        it { should == "<h5\n>t</h5\n>" }
      end

      describe "***** t" do
        subject { compile("***** t") }
        it { should == "<h6\n>t</h6\n>" }
      end

      describe "! t" do
        subject { compile("! t") }
        it { should == "<h2\n>t</h2\n>" }
      end
    end

    describe "ul" do
      describe "- t" do
        subject { compile("- t") }
        it { should == "<ul\n><li\n>t</li\n></ul\n>" }
      end

      describe "-- t" do
        subject { compile("-- t") }
        it { should == "<ul\n><ul\n><li\n>t</li\n></ul\n></ul\n>" }
      end

      describe "--- t" do
        subject { compile("--- t") }
        it { should == "<ul\n><ul\n><ul\n><li\n>t</li\n></ul\n></ul\n></ul\n>" }
      end

      describe "- t\\n-t" do
        subject { compile("- t\n-t") }
        it { should == "<ul\n><li\n>t</li\n><li\n>t</li\n></ul\n>" }
      end

      describe "- t\\n\\n- t" do
        subject { compile("- t\n\n- t") }
        it { should == "<ul\n><li\n>t</li\n></ul\n>\n<ul\n><li\n>t</li\n></ul\n>" }
      end

      describe "- t\\n--t" do
        subject { compile("- t\n--t") }
        it { should == "<ul\n><li\n>t</li\n><ul\n><li\n>t</li\n></ul\n></ul\n>" }
      end
    end

    describe "ol" do
      describe "+ t" do
        subject { compile("+ t") }
        it { should == "<ol\n><li\n>t</li\n></ol\n>" }
      end

      describe "++ t" do
        subject { compile("++ t") }
        it { should == "<ol\n><ol\n><li\n>t</li\n></ol\n></ol\n>" }
      end

      describe "+++ t" do
        subject { compile("+++ t") }
        it { should == "<ol\n><ol\n><ol\n><li\n>t</li\n></ol\n></ol\n></ol\n>" }
      end
    end

    describe "hr" do
      describe "-- " do
        subject { compile("-- ") }
        it { should == "<hr\n/>" }
      end

      describe "----" do
        subject { compile("----") }
        it { should == "<hr\n/>" }
      end

      describe "====" do
        subject { compile("====") }
        it { should == "<hr\n/>" }
      end
    end

    describe "blockquote" do
      describe ">t" do
        subject { compile(">t") }
        it { should == "<blockquote\n><p\n>t</p\n></blockquote\n>" }
      end

      describe "> t" do
        subject { compile("> t") }
        it { should == "<blockquote\n><p\n>t</p\n></blockquote\n>" }
      end
    end

    describe "table" do
      describe ",a" do
        subject { compile(",a") }
        it { should == "<table\n><tr\n><td\n>a</td\n></tr\n></table\n>" }
      end

      describe ", a" do
        subject { compile(", a") }
        it { should == "<table\n><tr\n><td\n> a</td\n></tr\n></table\n>" }
      end

      describe ",a,b" do
        subject { compile(",a,b") }
        it { should == "<table\n><tr\n><td\n>a</td\n><td\n>b</td\n></tr\n></table\n>" }
      end

      describe ",,b" do
        subject { compile(",,b") }
        it { should == "<table\n><tr\n><td\n></td\n><td\n>b</td\n></tr\n></table\n>" }
      end

      describe "|a" do
        subject { compile("|a") }
        it { should == "<table\n><tr\n><td\n>a</td\n></tr\n></table\n>" }
      end

      describe "|a|" do
        subject { compile("|a|") }
        it { should == "<table\n><tr\n><td\n>a</td\n></tr\n></table\n>" }
      end

      describe "|a|b|" do
        subject { compile("|a|b|") }
        it { should == "<table\n><tr\n><td\n>a</td\n><td\n>b</td\n></tr\n></table\n>" }
      end
    end

    describe "p" do
      describe "hello" do
        subject { compile("hello") }
        it { should == "<p\n>hello</p\n>" }
      end

      describe "hello,\\nqwik" do
        subject { compile("hello,\nqwik") }
        it { should == "<p\n>hello,\nqwik</p\n>" }
      end

      describe "hello,\\n\\nqwik" do
        subject { compile("hello,\n\nqwik") }
        it { should == "<p\n>hello,</p\n>\n<p\n>qwik</p\n>" }
      end
    end

    describe "pre" do
      describe " t" do
        subject { compile(" t") }
        it { should == "<pre\n>t</pre\n>" }
      end

      describe "\\tt" do
        subject { compile("\tt") }
        it { should == "<pre\n>t</pre\n>" }
      end

      describe "{{{\\nt\\n}}}" do
        subject { compile("{{{\nt\n}}}") }
        it { should == "<pre\n>t\n</pre\n>" }
      end

      describe "{{{\\nhello,\\n   qwik\\n}}}" do
        subject { compile("{{{\nhello,\n   qwik\n}}}") }
        it { should == "<pre\n>hello,\n   qwik\n</pre\n>" }
      end
    end

    describe "ref" do
      describe "[[t]]" do
        subject { compile("[[t]]") }
        it { should == "<p\n><a href=\"t.html\"\n>t</a\n></p\n>" }
      end

      describe "[[title|t]]" do
        subject { compile("[[title|t]]") }
        it { should == "<p\n><a href=\"t.html\"\n>title</a\n></p\n>" }
      end

      describe "[[qwik|http://qwik.jp/]]" do
        subject { compile("[[qwik|http://qwik.jp/]]") }
        it { should == "<p\n><a href=\"http://qwik.jp/\"\n>qwik</a\n></p\n>" }
      end

      describe "[[New!|http://img.yahoo.co.jp/images/new2.gif]]" do
        subject { compile("[[New!|http://img.yahoo.co.jp/images/new2.gif]]") }
        it { should == "<p\n><img alt=\"New!\" src=\"http://img.yahoo.co.jp/images/new2.gif\"\n/></p\n>" }
      end

      describe "official website for qwik is http://qwik.jp/" do
        subject { compile("official website for qwik is http://qwik.jp/") }
        it { should == "<p\n>official website for qwik is <a href=\"http://qwik.jp/\"\n>http://qwik.jp/</a\n></p\n>" }
      end
    end

    describe "em" do
      describe "''t''" do
        subject { compile("''t''") }
        it { should == "<p\n><em\n>t</em\n></p\n>" }
      end
    end

    describe "strong" do
      describe "'''t'''" do
        subject { compile("'''t'''") }
        it { should == "<p\n><strong\n>t</strong\n></p\n>" }
      end
    end

    describe "del" do
      describe "==t==" do
        subject { compile("==t==") }
        it { should == "<p\n><del\n>t</del\n></p\n>" }
      end
    end

    describe "dl" do
      describe ":dt:dd" do
        subject { compile(":dt:dd") }
        it { should == "<dl\n><dt\n>dt</dt\n><dd\n>dd</dd\n></dl\n>" }
      end

      describe ":dt:ddi\\n:dt2:dd2" do
        subject { compile(":dt:dd\n:dt2:dd2") }
        it { should == "<dl\n><dt\n>dt</dt\n><dd\n>dd</dd\n><dt\n>dt2</dt\n><dd\n>dd2</dd\n></dl\n>" }
      end

      describe ":dt" do
        subject { compile(":dt") }
        it { should == "<dl\n><dt\n>dt</dt\n></dl\n>" }
      end

      describe ":" do
        subject { compile(":") }
        it { should == "<dl\n/>" }
      end

      describe "::" do
        subject { compile("::") }
        it { should == "<dl\n/>" }
      end

      describe "::dd" do
        subject { compile("::dd") }
        it { should == "<dl\n><dd\n>dd</dd\n></dl\n>" }
      end
    end

    describe "plugin" do
      describe "{{t}}" do
        subject { compile("{{t}}") }
        it { should == "<plugin method=\"t\" param=\"\"\n/>" }
      end

      describe "{{t(a)}}" do
        subject { compile("{{t(a)}}") }
        it { should == "<plugin method=\"t\" param=\"a\"\n/>" }
      end

      describe "{{t(a, b)}}" do
        subject { compile("{{t(a, b)}}") }
        it { should == "<plugin method=\"t\" param=\"a, b\"\n/>" }
      end

      describe "{{t\\ns\\n)}}" do
        subject { compile("{{t\ns\n}}") }
        it { should == "<plugin method=\"t\" param=\"\"\n>s\n</plugin\n>" }
      end
    end

    describe "comment" do
      describe "# t" do
        subject { compile("# t") }
        it { should == "\n" }
      end
    end
  end
end
