# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} pypy3 )

inherit distutils-r1

MY_P=${P/-/.}
DESCRIPTION="General purpose exceptions for Zope packages"
HOMEPAGE="
	https://pypi.org/project/zope.exceptions/
	https://github.com/zopefoundation/zope.exceptions/"
SRC_URI="mirror://pypi/${PN::1}/${PN/-/.}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

RDEPEND="
	dev-python/namespace-zope[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]"
BDEPEND="
	test? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )"

distutils_enable_tests setup.py

python_install_all() {
	distutils-r1_python_install_all

	# remove .pth files since dev-python/namespace-zope handles the ns
	find "${D}" -name '*.pth' -delete || die
}
