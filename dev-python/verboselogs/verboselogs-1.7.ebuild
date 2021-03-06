# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Verbose logging for Python's logging module"
HOMEPAGE="https://pypi.org/project/verboselogs/
	https://github.com/xolox/python-verboselogs/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"

DEPEND="test? ( dev-python/mock[${PYTHON_USEDEP}] )"

PATCHES="${FILESDIR}/${P}-skip-sandbox-violation-test.patch"

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_test() {
	epytest ${PN}/tests.py
}
