# -*- coding: shift_jis -*-
# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

module Qwik; end

class Qwik::CatalogFactory
  def self.catalog_ja
    {
      # for test
      'hello' => '����ɂ���',

      # Error
      'Error' => '�G���[',
      'Failed' => '���s',

      # act-comment.rb
      'No message.' => '���b�Z�[�W������܂���',

      # act-povray.rb, act-textarea.rb
      'No text.' => '�e�L�X�g������܂���',

      # action.rb
      'No such site.' => '�Ή�����T�C�g������܂���',
      'No corresponding site.' => '�Ή�����T�C�g�͂���܂���',
      'Please send mail to make a site' =>
      'qwikWeb�̃T�C�g�����ɂ́A�܂����[���𑗂�K�v������܂��B',
      'Login' => '���O�C��',
      'Access here and see how to.' => '�ɃA�N�Z�X���āA�g�����������������B',
      'Please log in.' => '���O�C�����Ă�������',
      'Members Only' => '�����o�[��p', # and act-getpass.rb
      'You are now logged in with this user id.' =>
      '���Ȃ��͍����̃��[�UID �Ń��O�C�����Ă��܂�',
      'You are not logged in yet.' =>
      '���Ȃ��͂܂����O�C�����Ă��܂���', # FIXME: not found.
      'If you would like to log in on another account,' =>
      '�ʂ̃��[�UID �Ń��O�C�����Ȃ��������ꍇ�́A',
      'please log out first.' => '�܂����O�A�E�g���Ă�������',
      ': Access here, and log in again.' =>
      '���Ă���ēx�A�N�Z�X���Ă��������B', # FIXME: not found.
      'You need to log in to use this function.' =>
      '���̋@�\�𗘗p����ɂ̓��O�C������K�v������܂��B',
       'Go back' => '�߂�',
      'Please input POST' => 'POST���͂��K�v',
      'This function requires POST input.' =>
      '���̑����POST���͂ōs���K�v������܂��B',
      'Page not found.' => '�y�[�W��������܂���',
      'Push create if you would like to create the page.' =>
      '�y�[�W���쐬�������ꍇ�́A�V�K�쐬�������Ă�������', # act-new.rb

      'Incorrect path arguments.' => '�ςȃp�X�����Ă܂�',
      'Path arguments are not acceptable.' =>
      '�Ȃɂ��ςȃp�X����������Ă܂��B',

      'Not found.' => '����܂���',
      'Access here.' => '��������������������B',

      # act-album
      'Show album in full screen.' => '�A���o�����t���X�N���[���Ō���', # FIXME: not found

      # act-archive
      'Site archive' => '�T�C�g�A�[�J�C�u',

      # act-attach
      'Files' => '�Y�t�t�@�C��',
      'Delete' => '����',
      'Download' => '�_�E�����[�h', # act-files.rb
      'No such file.' => '�t�@�C����������܂���',
      'There is a file with the same file name.' =>
      '�����̃t�@�C�������݂��Ă��܂�', # FIXME: not found
      'Can not use Japanese characters for file name' =>
      '���{��̃t�@�C�����͎g���܂���', # FIXME: not found
      'Maximum size exceeded.' => '�t�@�C���T�C�Y�̌��E�𒴂��Ă��܂��B',
      'Maximum size' => '�ő�e��',
      'File size' => '�t�@�C���T�C�Y',
      'The file is saved.' => '�t�@�C�����Z�[�u���܂����B',
      'File attachment completed' => '�t�@�C����Y�t���܂���',
      'Attach file' => '�t�@�C���Y�t',
      'Attach a file' => '�t�@�C����Y�t���܂�',
      'Confirm file deletion' => '�t�@�C�������m�F���',
      "Push 'Delete' to delete a file" =>
      '�u��������v�������ƁC�{���Ƀt�@�C�����������܂��D',
      'Delete' => '��������',
      'Already deleted.' => '���łɏ�������Ă���悤�ł�',
      'Failed to delete.' => '�t�@�C�������Ɏ��s���܂����B��B',
      'The file has been deleted.' => '�������܂���',
      'File list' => '���ݓY�t����Ă���t�@�C��',
      # other
      '->' => '��',
      'Attach' => '�Y�t����',	# FIXME: not found

      # act-backup
      'This is the first page.' => '����͍ŏ��̃y�[�W�ł��B',
      'Difference from the previous page' => '�O�񂩂�̍���',
      'Original data' => '���f�[�^',
      '<-' => '��',
      'Newest' => '�ŐV',
      'Backup list' => '�o�b�N�A�b�v�ꗗ',

      # act-basic-plugin
#      'New page' => '�V�K�쐬',
#      'Edit' => '�ҏW',
      'newpage' => '�V�K�쐬',
      'edit' => '�ҏW',
      'wysiwyg' => '���̏�ŕҏW',
      'Last modified' => '�ŏI�X�V',
      'Generation time' => '��������',
      'seconds' => '�b',

      # act-edit
      'Site Menu' => '�T�C�g���j���[',
      'Site Configuration' => '�T�C�g�ݒ�',
      'Group members' => '�O���[�v�����o�[',
      'Site Archive' => '�T�C�g�A�[�J�C�u',
      'Mailing List Configuration' => '���[�����O���X�g�ݒ�',

      'Functions' => '�@�\�̐���',
      'Page List' => '�y�[�W�ꗗ',
      'Recent Changes' => '�X�V����',
      ' ago' => '�O',
      'more...' => '�����ƑO�̏��',
      'min.' => '��',
      'hour' => '����',
      'day' => '��',
      'month' => '����',
      'year' => '�N',
      'century' => '���I',

      # act-comment
      'User' => '���[�U��',
      'Message' => '���b�Z�[�W',
      'Message has been added.' => '���b�Z�[�W��ǉ����܂���',

      # act-config
      'Site config'	=> '�T�C�g�ݒ�',
      'Site Configuration' => '�T�C�g�ݒ�',

      # act-chronology
      'Time walker' => '���ԗ��s',
      'Chronology' => '�N�\',

      # act-day
      'One day' => '���',

      # act-describe
      'Function' => '�@�\����',
      'Functions list' => '�@�\�ꗗ',

      # act-edit.rb
      'Page is deleted.' => '�y�[�W���폜���܂���',
      'Password does not match.' => '�p�X���[�h����v���܂���ł����B',
      'Password' => '�p�X���[�h',
      'Please find a line like that above, then input password in parentheses.' =>
      '���̂悤�ȍs��T���āA���ʂ̒��Ƀp�X���[�h����͂��Ă��������B',

      'Page edit conflict' => '�X�V���Փ˂��܂����B',
      'Please save the following content to your text editor.' =>
      '���L�̓��e���e�L�X�g�G�f�B�^�Ȃǂɕۑ����A',
      'Newest page' => '�ŐV�̃y�[�W',
      ': see this page and re-edit again.' => '���Q�ƌ�ɍĕҏW���Ă��������B',
      'Page is saved.' => '�y�[�W��ۑ����܂����B',
      'Save' => '�ۑ�',
      'Attach' => '�Y�t',

      'Edit' => '�ҏW',
      'Attach Files' => '�t�@�C���Y�t',
      'Attach many files' => '�����Ƃ�������Y�t����',

      'Help' => '�w���v',
      'How to qwikWeb' => 'qwikWeb�̎g����',

      'Site administration' => '�T�C�g�Ǘ�',

      'Header' => '���o��',
      'List' => '�ӏ��� ',
      'Ordered list' => '�������X�g ',
      'Block quote' => '���p ',
      'Word' => '��` ',
      'Definition' => '���t�̒�` ',
      'Table' => '�\ ',
      'Emphasis' => '����',
      'Stronger' => '�����Ƌ���',
      'Link' => '�����N',
      'more help' => '�����Əڂ�������',

      'Text Format' => '�����ꗗ',
      'History' => '����',
      'Backup' => '�o�b�N�A�b�v',
      'Time machine' => '�^�C���}�V�[��',
      'Page functions' => '�y�[�W�̋@�\ ',
#      'Experimental functions' => '�������̋@�\ ',

      # act-getpass
      'Invalid mail address' => '�p�X���[�h�`���G���[',
      'Get Password' => '�p�X���[�h����',
      'Send Password' => '�p�X���[�h���M',
      'You will receive the password by e-mail.' => '�p�X���[�h�����[���ő���܂�',
      'Please input your mail address.' => '���[���A�h���X����͂��Ă�������',
      'Mail address' => '���[���A�h���X',
      'Go back to Login screen' => '���O�C����ʂɂ��ǂ�',

      'Send' => '���M',
      'Send' => '���M',

      'You input this e-mail address as user ID.' =>
      '���Ȃ��̓��[�UID�Ƃ��Ă��̃��[���A�h���X����͂��܂���',
      'This user with this ID is not a member of this group.' =>
      '���̃��[�UID�́A���̃O���[�v�ɂ͊܂܂�Ă��܂���',
      'Only the member of this group can get a password.' =>
      '���̃O���[�v�̃����o�[�́A�p�X���[�h���擾�ł��܂��B',

      'Your password:' => '�p�X���[�h :',
      'This is your user name and password: ' =>
      '���̃T�C�g�ɂ����郆�[�U���ƃp�X���[�h�ł� : ',
      'Username' => '���[�U��',
      'Password' => '�p�X���[�h',
      'Please access login page' =>
      '���O�C���y�[�W�ɃA�N�Z�X���Ă������� :',

      'You can input the user name and password from this URL automatically.' =>
      '���LURL�ɃA�N�Z�X����ƁA�����I�Ƀ��[�U�[���ƃp�X���[�h����͂��܂��B',
      'The mail address format is wrong.' =>
      '���[���A�h���X�̌`�����Ԉ���Ă܂��B',
      'Please confirm the input again.' => '������x���͂��m�F���Ă��������B',
      'Please access again.' => '�ēx�A�N�Z�X���Ă��������B',
      'Send Password Error' => '���[�����M�G���[',
      'Send failed because of system error.' =>
      '�V�X�e���G���[�̂��߁A�p�X���[�h���M�Ɏ��s���܂����B',
      'Please contact the administrator.' => '�V�X�e���Ǘ��҂ɂ��A���������B',

      'Send Password done' => '�p�X���[�h���M����',
      'I send the password to this mail address.' =>
      '�p�X���[�h���ȉ��̃��[���A�h���X�ɑ��M���܂����B',
      'Please check your mailbox.' => '���[���{�b�N�X���m�F���Ă�������',

      # act-group
      'Member list' => '�����o�[�ꗗ',

      # act-hcomment
      'Name' => '�����O',
      'Comment' => '�R�����g',
      'Anonymous' => '����������',
      'Add a comment.' => '�R�����g��ǉ����܂���',
      'Submit' => '���e',
      'Page collision is detected.' => '�X�V���Փ˂��܂���',
      'Go back and input again.' => '���̃y�[�W�ɖ߂�A�ēx���͂��Ă��������B',

      # act-history
      'Time machine' => '�^�C���}�V�[��',
      'Move this' => '����𓮂����ĉ�����',

      # act-license
      'You can use the files on this site under [[Creative Commons by 2.1|http://creativecommons.org/licenses/by/2.1/jp/]] license.' =>
      '�����ɒu���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y �A�� 2.1|http://creativecommons.org/licenses/by/2.1/jp/]]���C�Z���X�̉��ɗ��p�ł��܂��B',
      'You can use the files on this site under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      '�����ɒu���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y �A�� - ����������� 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]���C�Z���X�̉��ɗ��p�ł��܂��B',
      'The files you uploaded will be under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      '�����ɃA�b�v���[�h���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y �A�� - ����������� 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]���C�Z���X�̉��ɒu����܂��B',

      # act-login
      'Log out' => '���O�A�E�g',
      'Log in by Session' => 'Session�ɂ�郍�O�C��', # FIXME: not found
      'Success' => '����',
      'Go next' => '����',
      'Session ID Authentication' => 'Session ID �F��', # FIXME: not found
      'or, Access here.' => '�܂��́A������������p�������B',
      'Log in using Basic Authentication.' => 'Basic�F�؂Ń��O�C�����܂����B',
      'Log in by Basic Authentication.' => 'Basic�F�؂Ń��O�C��',
      'Logging in by Basic Authentication.' => 'Basic�F�؂Ń��O�C�����܂��B',
      'Log in by cookie.' => 'cookie�ɂ�郍�O�C��',
      'You are already logged in by cookie.' => '����cookie�Ń��O�C�����Ă��܂��B',
      'You can log in by TypeKey.' => 'TypeKey�ł����O�C���ł��܂��B', # FIXME: not found
      'Login Error' => '���O�C���G���[',
      'Invalid ID (E-mail) or Password.' =>
      '���[�UID(E-mail)�������̓p�X���[�h���Ⴂ�܂�',

      'Already logged in.' => '���O�C���ς�',

      'Please confirm the mail again.' =>
      '���͂ɊԈႢ���Ȃ����ǂ���������x���[�������m�F���������B',

      # FIXME: not found
      '(Please do not use copy and paste. Please input the password from the keyboard again.)' =>
      '(�R�s�[&�y�[�X�g���ƃG���[�ɂȂ�ꍇ������܂��B���̏ꍇ�͂��萔�ł����L�[�{�[�h������͂��Ă݂Ă�������)',
      'Can not log out.' => '���O�A�E�g�ł��܂���',
      'You can not log out in Basic Authentication mode.' =>
      'Basic�F�؂̏ꍇ�̓��O�A�E�g�ł��܂���B',
      'Please close browser and access again.' =>
      '��U�u���E�U����āA�ēx�A�N�Z�X���Ă��������B',
      'Terminal Number is deleted.' => '�[���ԍ����폜���܂���',
      'Basic Authentication' => 'Basic�F��',
      'For mobile phone users' => '�g�ѓd�b�̕��͂������',
      'Log out done.' => '���O�A�E�g����',
      'Confirm' => '�m�F',
      'Push "Log out".' =>
      '�u���O�A�E�g����v�������ƁA�{���Ƀ��O�A�E�g���܂��B',
      'Log out' => '���O�A�E�g����',

      'Log in to ' => '���O�C�����܂� : ',
      'Please input ID (E-mail) and password.' =>
      '���[�UID�ƃp�X���[�h����͂��Ă�������',
      'ID' => '���[�UID',
      'Password' => '�p�X���[�h',

      'If you have no password,' => '�p�X���[�h���������łȂ�����',
      'Access here' => '�����������������',
      'If you have no password' => '�p�X���[�h���܂������ĂȂ�?',
      'For mobile phone users, please use' => # FIXME: not found
      '�g�ѓd�b�̕��́A������������p������',
      'You can also use TypeKey' => 'TypeKey���g���܂�', # FIXME: not found
      'Log in by TypeKey' => 'TypeKey�Ń��O�C��',
      'Please send mail address for authentication.' =>
      '�F�؂̂��߁A���[���A�h���X�𑗐M���Ă�������',

      # act-member
      'Add a member' => '�����o�[�ǉ�',
      'Mail address to add' => '�ǉ����郁�[���A�h���X',
      'Add' => '�ǉ�',
      'Invalid Mail' => '�����ȃ��[���A�h���X',
      'Already exists' => '���łɑ��݂��Ă��܂�',
      'Member added' => '�����o�[�͒ǉ�����܂���',
      'Member list' => '�����o�[�ꗗ',
      'Member' => '�����o�[',

      # act-mlsubmitform
      'Mlcommit' => '���e����B',

      # act-pagelist
      'Recent change' => '�ŐV�̍X�V',

      # act-plan
      'Plan' => '�\��',
      'New plan' => '�V�����\��',
      'Create a new plan' => '�V�����\��̓o�^',
      'Please input like this' => '���̂悤�ɓ��͂��Ă�������',
      'Already exists.' => '���łɂ���܂���',

      # act-schedule
      'Schedule' => '�X�P�W���[��',
      'Date' => '���t',
      'Schedule edit done.' => '�X�P�W���[������͂��܂����B',

      # act-slogin
      'Session ID is registered.' => 'Session ID��o�^���܂����B', # FIXME: not found

      # act-style
      'Access Failed' => '�A�N�Z�X�ł��܂���ł���',

      # act-map
      'Show map in full screen.' => '�n�}���t���X�N���[���Ō���',

      # act-mcomment
      'Failed' => '���s���܂���',

      # act-mdlb
      'Please specify file.' => '�t�@�C�����w�肵�Ă��������B',
      'Please contact the administrator.' => '�Ǘ��҂ɘA�����Ă��������B',
      'The file is saved with this filename.' =>
      '���̃t�@�C�����ŃZ�[�u����܂����B',
      'The image is also saved.' =>
      '�摜�t�@�C�����Z�[�u����܂����B',
      'Model file' => '���f���t�@�C��',
      'Image file' => '�摜�t�@�C��',

      # act-mdblb-model
#      'Title' => '�^�C�g��',
      'Author' => '���',
#      'Comment' => '�R�����g',
      'Download' => '�_�E�����[�h',

      # act-new
      'Push create.' => '�V�K�쐬�������Ă��������B',
      'New page' => '�V�K�쐬',
      'Title' => '�^�C�g��',
      'PageKey' => '�y�[�W�L�[',
      'Already exists' => '���łɑ��݂��Ă��܂�',
      ' already exists.' => '�͂��łɑ��݂��Ă��܂��B',
      'Please specify another title.' => '�Ⴄ�^�C�g�����w�肵�Ă��������B',
      'Created.' => '�쐬���܂���',
      'Edit new page' => '�V�K�y�[�W��ҏW',

      # etc.
      'Show history' => '�ߋ��̕ϑJ��H��',
      'Show backup' => '���܂܂ł̗���',

      # act-presen
      'Presentation mode' => '�v���[�����[�h',
      'Presentation mode' => '�v���[�����[�h',
      # other
      'Present' => '�v���[��',
      'presentation' => '�v���[���e�[�V����',

      # act-search
      'Search' => '����',
      'Search result' => '��������',
      'No match.' => '������܂���ł����B',

      # act-sendpass
      'Succeeded.' => '�������܂���',
      'Failed.' => '���s���܂���',
      'Wrong format.' => '�`�����Ⴂ�܂�',
      'Not a member.' => '�����o�[�ł͂���܂���',
      'You can send password for the members.' =>
      '�����o�[�Ƀp�X���[�h�𑗐M���邱�Ƃ��ł��܂��B',
      'Please select members to send password.' =>
      '�p�X���[�h�𑗂郁���o�[��I�����Ă��������B',

      # act-table-edit
      'You can only use a table.' => 'table�����g���܂���B',
      'You can only use text.' => 'text�����g���܂���B',
      'Update' => '�X�V',
      'Edit done.' => '�ҏW����',

      # act-textarea
      'Edit text done.' => '�e�L�X�g��ҏW���܂���',

      # act-takahashi
      'Show in full screen.' => '�t���X�N���[���Ō���', # FIXME: not found

      # act-toc
      'contents' => '�ڎ�',
      'Contents' => '�ڎ�',

      # act-typekey
      'Cannot use.' => '�g���܂���B',
      'There is no site token for TypeKey.' =>
      'TypeKey�p�̃T�C�g�g�[�N��������܂���B',
      'Verify failed.' => '�F�؂ł��܂���ł����B',
      'Time out.' => '���Ԑ؂�ł��B',

      # act-wysiwyg
      'Edit in this page' => '���̏�ŕҏW',
      'Auto-save' => '�����ۑ�',
#       'This is an experimental function.' => '���̋@�\�͂܂��������ł��B',
#       'The contents will be translated to html.' =>
#       '�y�[�W�̓��e�́A�S��HTML�ɕϊ�����܂��B',
#       'Please use this function only if you understand what will happen.' =>
#       '�����N��̂��𗝉�����Ă���ꍇ�̂݁A���g���������B',

      # act-wema
      'How to use post-its' => '��Ⳃ̎g����',
      'New post-it is created.' => '�tⳂ�V�K�ɍ쐬���܂���',
      'Edit done.' => '�ҏW���܂���',
      'No action.' => '�������܂���ł���',
      'Delete a Post-it.' => '�tⳂ��������܂���',
      'Set position.' => '�ʒu���Z�b�g���܂���',
      'Post-it' => '���',
      'New Post-it' => '�V�K���',
      'Help' => '�g����',
      'Draw Line' => '��������',
      'Text color' => '�����F',
      'Background' => '�w�i�F',

      # act-site-backup
      'Site backup' => '�T�C�g�o�b�N�A�b�v',

      # act-files
      'Attached files total:' => '�Y�t�t�@�C�����v:',
      'Exceeded limit.' => '�ő�e�ʂ𒴂��܂���',
      '%s left' => '�c��%s',
      'Total file size exceeded.' => '���t�@�C���T�C�Y�̌��E�𒴂��Ă��܂��B',
      'Reaching limit.' => '�e�ʂ����Ȃ��Ȃ��Ă��Ă��܂��B',
      'Maximum total size' => '�Y�t�t�@�C���̍ő�',
      'Current total size' => '���݂̓Y�t�t�@�C���̍��v',


      # Add you catalog here.
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
    }
  end
end
