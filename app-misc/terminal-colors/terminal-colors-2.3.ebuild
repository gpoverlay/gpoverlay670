# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="ncurses"

inherit python-r1

DESCRIPTION="A tool to display color charts for 8, 16, 88, and 256 color terminals"
HOMEPAGE="http://zhar.net/projects/shell/terminal-colors"
SRC_URI="https://dev.gentoo.org/~radhermit/distfiles/${P}.gz"
S="${WORKDIR}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86 ~x64-macos"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"

src_install() {
	python_foreach_impl python_newscript ${P} ${PN}
}
