# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Hebrew open source multiscript font"
HOMEPAGE="http://alef.hagilda.com/"
SRC_URI="http://alef.hagilda.com/Alef.zip"
S="${WORKDIR}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~riscv ~x86"

BDEPEND="app-arch/unzip"

FONT_SUFFIX="ttf"
FONT_S="${S}/TTF"
DOCS=( readme.txt )
