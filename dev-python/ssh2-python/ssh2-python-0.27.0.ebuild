# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Super fast SSH2 protocol library, Python bindings for libssh2"
HOMEPAGE="https://pypi.org/project/ssh2-python/"
SRC_URI="https://github.com/ParallelSSH/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	net-libs/libssh2
	dev-libs/openssl
	sys-libs/zlib
"
python_configure_all() {
	export SYSTEM_LIBSSH2=1
}
