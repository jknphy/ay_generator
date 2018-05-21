#! /bin/bash
#
# Copyright (C) 2018 SUSE LLC
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

# Summary: <description>
# Output files: /ay_profile.xml

# Maintainer: Joaquín Rivera <jeriveramoya@suse.com>

saxon9 autoinst.xml autoinst.xsl \
       arch=ppc64le \
       scc_regcode=30452ce234918d23 \
       scc_url=http://all-620.2.proxy.scc.suse.de \
       arch=ppc64le \
       scc_addons=bs,desktop > ay_profile.xml
if [ $? -ne 0 ]; then
  echo "Error while preparing autoYasT file" >&2
  exit 1
fi
