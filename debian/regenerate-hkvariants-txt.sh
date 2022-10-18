#!/bin/sh
#
# regenerate-hkvariants-txt.sh - Regenerate HKVariants.txt from opencc
#
# SPDX-FileCopyrightText: 2021 Boyuan Yang <byang@debian.org>
# SPDX-License-Identifier: CC0-1.0
#
# Usage: ./regenerate-hkvariants-txt.sh (run at packaging repo topdir)
#
# This will generate the HKVariantsFull.txt used by rime-cantonese.
# Based on discussion in https://t.me/open_chinese_convert .

HKVARIANTS_OCD2_FILE="/usr/share/opencc/HKVariants.ocd2"
BASEDIR=$(dirname "$0")

opencc_dict -i "${HKVARIANTS_OCD2_FILE}" -f ocd2 -o HKVariants.txt -t text
perl -CSD -pe 's/^((.)\t((?!\2).)+)$/\1 \2/g' HKVariants.txt > HKVariantsFull.txt
mv ./HKVariantsFull.txt "${BASEDIR}"/../opencc/
rm -f HKVariants.txt

exit 0
