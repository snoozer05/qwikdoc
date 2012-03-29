# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

$LOAD_PATH.unshift '..' unless $LOAD_PATH.include? '..'
require 'qwik/act-include'

module Qwik
  class Action
    D_PluginDiary = {
      :dt => 'Diary plugin',
      :dd => 'You can create a diary page.',
      :dc => "* How to
TBD
"
    }

    D_PluginDiary_ja = {
      :dt => '���L�v���O�C��',
      :dd => '���L�y�[�W�����܂��B',
      :dc => "* �g����
�Ⴆ�΁uUser�v�Ƃ����y�[�W���̃y�[�W�����܂��B
���̃y�[�W�ɉ��L�̂悤�ɓ��L�v���O�C���𖄂ߍ��݂܂��B
 {{diary}}

���L�y�[�W�́uUser_20070417�v�Ƃ����悤�ɁuUser_�v�Ƃ���prefix�̌��
���t���������悤�ȃy�[�W���ŋL�q���Ă��������B
�uUser�v�y�[�W�ɂ́A�����̓��L�̈ꗗ���\������܂��B
"
    }

    def plg_diary(include_days = 10)
      keys = []
      @site.each {|page|
	if /\A#{@req.base}_(\d\d\d\d\d\d\d\d)\z/ =~ page.key
	  keys << page.key
	end
      }

      recent_days = keys.sort.reverse[0, include_days]

      div = []
      recent_days.each {|key|
	page = @site[key]
	div << [:h2, [:a, {:href=>page.url}, page.get_title]]
	div += plg_include(key)
      }

      return div
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActDiary < Test::Unit::TestCase
    include TestSession

    def test_plg_diary
      t_add_user

      page = @site.create('Diary')
      page.store("{{diary}}")
      page1 = @site.create('Diary_20070417')
      page1.store("d1")
      page2 = @site.create('Diary_20070418')
      page2.store("d2")

      res = session('/test/Diary.html')
      ok_in([[:div,
		{:class=>"day"},
		"",
		[:div,
		  {:class=>"body"},
		  [:div, {:class=>"section"}, [[:p, "d2"]]],
		  [:"!--", "section"]],
		[:"!--", "body"]],
	      [:"!--", "day"]],
	    "//div[@class='section']")

=begin
      res = session('/test/Diary.html')
      ok_in([[[:div,
		  {:class=>"day"},
		  "",
		  [:div,
		    {:class=>"body"},
		    [:div, {:class=>"section"}, [[:p, "d2"]]],
		    [:"!--", "section"]],
		  [:"!--", "body"]],
		[:"!--", "day"]],
	      [[:div,
		  {:class=>"day"},
		  "",
		  [:div,
		    {:class=>"body"},
		    [:div, {:class=>"section"}, [[:p, "d1"]]],
		    [:"!--", "section"]],
		  [:"!--", "body"]],
		[:"!--", "day"]]], "//div[@class='section']")
=end

    end
  end
end
