# -*- coding: shift_jis -*-
# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

module QuickML
  class CatalogFactory
    def self.catalog_ja
      {
	# Code convert setting.
	:charset => 'iso-2022-jp',
	:codeconv_method => :tojis,

	# for test
	'hello' => "����ɂ���",

	# Original QuickML messages.
	"<%s> was removed from the mailing list:\n<%s>\n" =>
	"<%s> ��\n���[�����O���X�g <%s> ����폜����܂����B\n",

	"because the address was unreachable.\n" =>
	"���[�����͂��Ȃ����߂ł��B\n",

	"ML will be closed if no article is posted for %d days.\n\n" =>
	"���̃��[�����O���X�g�� %d���ȓ��ɓ��e���Ȃ��Ə��ł��܂��B\n\n",

	"Time to close: %s.\n\n" =>
	"���ŗ\�����: %s\n\n",

	'%Y-%m-%d %H:%M' =>
	"%Y�N%m��%d�� %H��%M��",

	"You are not a member of the mailing list:\n<%s>\n" =>
	"���Ȃ��� <%s> ���[�����O���X�g�̃����o�[�ł͂���܂���B\n",

	"The original body is omitted to avoid spam trouble.\n" =>
	"���[���{�̂̓X�p���΍�̂��ߏȗ�����܂����B\n",

	"You are removed from the mailing list:\n<%s>\n" =>
	"���Ȃ��� <%s> ���[�����O���X�g����폜����܂����B\n",

	"by the request of <%s>.\n" =>
	"<%s> ���폜�����肢�������߂ł��B\n",

	"You have unsubscribed from the mailing list:\n<%s>.\n" =>
	"���Ȃ��� <%s> ���[�����O���X�g����މ�܂����B",


	"The following addresses cannot be added because <%s> mailing list reaches the maximum number of members (%d persons)\n\n" =>
	"<%s> ���[�����O���X�g�̓����o�[�̍ő�l�� (%d�l)\n�ɒB�����̂ňȉ��̃A�h���X�͒ǉ��ł��܂���ł����B\n\n",

	"Invalid mailing list name: <%s>\n" =>
	"<%s> �͐������Ȃ����[�����O���X�g���ł��B\n",

	"You can only use 0-9, a-z, A-Z,  `-' for mailing list name\n" =>
	"���[�����O���X�g���ɂ� 0-9, a-z, A-Z, �u-�v�������g���܂��B\n",

	"Sorry, your mail exceeds the length limitation.\n" =>
	"�\���󂠂�܂���B���Ȃ��̃��[���̃T�C�Y�͐����𒴂��܂����B\n",

	"The max length is %s bytes.\n\n" =>
	"���[���̃T�C�Y�̐����� %s �o�C�g�ł��B\n\n",

	"[%s] Unsubscribe: %s" =>
	"[%s] �މ�: %s",

	"[%s] ML will be closed soon" =>
	"[%s] ���[�����O���X�g��~�̂��ē�",

	"[%s] Removed: <%s>" =>
	"[%s] �����o�[�폜: <%s>",

	"Members of <%s>:\n" =>
	"<%s> �̃����o�[:\n",

	"How to unsubscribe from the ML:\n" =>
	"����ML��މ����@:\n",

	"- Just send an empty message to <%s>.\n" =>
	"- �{������̃��[���� <%s> �ɑ����Ă�������\n",

	"- Alternatively, if you cannot send an empty message for some reason,\n" =>
	"- �{������̃��[���𑗂�Ȃ��ꍇ�́A\n",

	"  please send a message just saying 'unsubscribe' to <%s>.\n" =>
	"  �{���Ɂu�މ�v�Ƃ������������[���� <%s> �ɑ����Ă�������\n",

	"  (e.g., hotmail's advertisement, signature, etc.)\n" =>
	"  (������hotmail�̍L���Ȃǂ����ċ󃁁[���𑗂�Ȃ��ꍇ�Ȃ�)\n",

	"[QuickML] Error: %s" =>
	"[QuickML] �G���[: %s",

	"New Member: %s\n" =>
	"�V�����o�[: %s\n",

	"Did you send a mail with a different address from the address registered in the mailing list?\n" =>
	"���[�����O���X�g�ɓo�^�������[���A�h���X�ƈقȂ�A�h���X���烁�[���𑗐M���Ă��܂���?\n",

	"Please check your 'From:' address.\n" =>
	"���o�l�̃��[���A�h���X���m�F���Ă��������B\n",

	"Info: %s\n" => 
	"�g����: %s\n",

	"----- Original Message -----\n" =>
	"----- ���̃��b�Z�[�W -----\n",

	"[%s] Confirmation: %s" =>
	"[%s] �m�F: %s",

	# qwikWeb messages.
	"First, please read the agreement of this service.\n" =>
	"�܂����L�̗��p�K������ǂ݉������B\n",

	"http://qwik.jp/qwikjpAgreementE.html\n" =>
	"http://qwik.jp/qwikjpAgreementJ.html\n",

	"You must agree with this agreement to use the service.\n" =>
	"���̃T�[�r�X�𗘗p����ɂ́A���p�K������F���Ă��������K�v������܂��B\n",

	"If you agree, then,\n" =>
	"�������F����ꍇ�A\n",

	"Please simply reply to this mail to create ML <%s>.\n" =>
	"���̃��[���ɕԐM����� <%s> ���[�����O���X�g������܂��B\n",

	"WARNING: Total attached file size exceeded." =>
	"�x��: �Y�t�t�@�C���̍��v�T�C�Y���ő�e�ʂ𒴂��Ă��܂��B",

	'Files are not attached on the web.' =>
	"�Y�t�t�@�C����Web�ɕۑ�����܂���B",

	"WARNING: Total attached file size is reaching to the limit." =>
	"�x��: �Y�t�t�@�C���̍��v�T�C�Y���ő�e�ʂɋ߂Â��Ă��܂��B",

	"%s left" =>
	"�c��%s",

	"\nFile '%s' was not attached.\n" =>
	"\n�t�@�C�� '%s' �͕ۑ�����܂���ł����B\n",
      }
    end
  end
end
