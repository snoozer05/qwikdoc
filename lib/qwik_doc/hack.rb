#coding: utf-8
module Qwik
  class InlineTokenizer
    #Parse a line into tokens using strscan.
    def self.tokenize(str)
      line_ar = []

      s = StringScanner.new(str)

      while ! s.eos?
        if s.scan(/'''(?!:')/)
          line_ar << :"'''"
        elsif s.scan(/''(?!:')/)
          line_ar << :"''"
        elsif s.scan(/==/)
          line_ar << :'=='
        elsif s.scan(/\[\[(.+?)\]\]/)	# [[title|url]] format
          line_ar << [:ref, s[1]]
        elsif s.scan(/\[([^\[\]\s]+?) ([^\[\]\s]+?)\]/) # [url title] format
          line_ar << [:ref, s[2]+'|'+s[1]]
        elsif s.scan(/\{\{([^\(\)]+?)(?:\((.*?)\))?\s*\}\}/)	# {{t(a)}}
          ar = [:plugin, s[1]]
          ar << s[2] if s[2]
          line_ar << ar
        elsif s.scan(/#{URL}/)
          href = s.matched
          line_ar << [:url, href]
        elsif s.scan(/[^#{SPECIAL}]+/)
          m = s.matched
          if /([^a-zA-Z\d]+)(#{URL})/ =~ m
            ss = $` + $1
            line_ar << ss
            skip_str = ss
            s.unscan
            s.pos = s.pos + skip_str.bytesize
          else
            line_ar << m
          end
        elsif s.scan(/(.+?)([^#{SPECIAL}])/)
          ss = s[1]
          line_ar << ss
          s.unscan
          s.pos = s.pos + ss.length
        else
          ss = s.string
          line_ar << ss[s.pos..ss.bytesize]
          s.terminate
        end
      end
      line_ar
    end
  end

  class InlineParser
    def self.parse_ref(uri)
      text, uri = $1, $2 if /\A([^|]*)\|(.+)\z/ =~ uri
      if text.nil? or text.empty?
        text = uri
      end

      case uri
      when /\A#{URL}/o
        if /\.(?:jpg|jpeg|png|gif)\z/i =~ uri
          [:img, {:src=>uri, :alt=>text}]
        else
          [:a, {:href=>uri}, text]
        end
      when /\A(.+?):(.+)\z/
        [:plugin, {:method=>'interwiki', :param=>uri}, text]
      else
        uri = "#{uri}.html" unless uri.include?('.')
        [:a, {:href=>uri}, text]
      end
    end
  end

  class TextTokenizer
    # Tokenize a text.
    def self.tokenize(str, br_mode=false)
      tokens = []
      in_multiline = {}

      scanner = StringScanner.new(str)
      while ! scanner.eos?
        line = scanner.scan(/.*$/)
        newline = scanner.scan(/\n/)

        line.chomp!

        # At the first, check if it is in a multiline block.
        last_token = tokens.last
        if last_token
          last_tag = last_token[0]
          if in_multiline[last_tag]
            if MULTILINE[last_tag][1] =~ line
              in_multiline[last_tag] = nil
            else
              last_token[-1] += "#{line.chomp}\n"
            end
            next
          end
        end

        line.chomp!

        # preprocess
        #line.gsub!(/&my-([0-9]+);/) {|m| "{{my_char(#{$1})}}" }

        case line
        when MULTILINE[:plugin][0]
          in_multiline[:plugin] = true
          tokens << [:plugin, $1.to_s, $2.to_s, '']
        when MULTILINE[:pre][0]
          in_multiline[:pre] = true
          tokens << [:pre, '']
        when MULTILINE[:html][0]
          tokens << [:html, '']
          in_multiline[:html] = true
        when /\A====+\z/, '-- ', /\A----+\z/		# hr
          tokens << [:hr]
        when /\A(\-{1,3})(.+)\z/			# ul
          tokens << [:ul, $1.size, $2.to_s.strip]
        when /\A(\+{1,3})(.+)\z/			# ol
          tokens << [:ol, $1.size, $2.to_s.strip]
        when /\A>(.*)\z/				# blockquote
          tokens << [:blockquote, $1.strip]
        when /\A[ \t](.*)\z/				# pre
          tokens << [:pre, $1]
        when /\A\{\{([^\(\)\{\}]+?)(?:\(([^\(\)\{\}]*?)\))?\}\}\z/	# plugin
          tokens << [:plugin, $1.to_s, $2.to_s]
        when '', /\A#/					# '', or comment.
          tokens << [:empty]				# empty line
        when /\A([,|])(.*)\z/				# pre
          #re = Regexp.new(Regexp.quote($1), nil, 's')
          re = Regexp.new(Regexp.quote($1), nil)
          ar = [:table] + $2.split(re).map {|a| a.to_s }
          tokens << ar
        when /\A:(.*)\z/				# dl
          rest = $1
          dt, dd = rest.split(':', 2)
          if dt && dt.include?('(')
            if /\A(.*?\(.*\)[^:]*):(.*)\z/ =~ rest	# FIXME: Bad hack.
              dt, dd = $1, $2
            end
          end
          ar = [:dl]
          ar << ((dt && ! dt.empty?) ? dt.to_s.strip : nil)
          ar << ((dd && ! dd.empty?) ? dd.to_s.strip : nil)
          tokens << ar
        when /\A([*!]{1,5})\s*(.+)\s*\z/		# h
          h = $1
          s = $2
          s = s.strip
          if s.empty?		# '* '
            inline(tokens, line, br_mode)
          else
            tokens << [("h#{h.size+1}").intern, s]
          end
        else
          inline(tokens, line, br_mode)
        end
      end

      return tokens
    end

    private
    def self.inline(tokens, line, br_mode)
      if /~\z/ =~ line
        line = line.sub(/~\z/, '{{br}}')
      elsif br_mode
        line = "#{line}{{br}}"
      end
      tokens << [:text, line]
    end
  end
end

class String
  def escapeHTML
    string = self
    return string.gsub(/[&"<>]/) {|x| EscapeTable[x] }
  end
end
