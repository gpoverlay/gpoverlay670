# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{8..10} )
# The package uses pkg_resources
DISTUTILS_USE_SETUPTOOLS=manual

inherit distutils-r1

MY_COMMIT="97392d008cc8"

DESCRIPTION="A very small text templating language"
HOMEPAGE="https://pypi.org/project/Tempita/"
# Tests are not published on PyPI
SRC_URI="https://bitbucket.org/ianb/${PN}/get/${MY_COMMIT}.tar.gz -> ${P}-bitbucket.tar.gz"
S="${WORKDIR}/ianb-${PN}-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"

PATCHES=(
	# cgi.escape has been removed in Python 3.9
	"${FILESDIR}/${P}-cgi-escape.patch"
	# The 2to3 option for setuptools is deprecated
	"${FILESDIR}/${P}-2to3.patch"
)

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_prepare_all() {
	# Remove reference to a non-existent CSS file
	# in order to make sphinx use its default theme.
	sed -i '/^html_style =/d' docs/conf.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	epytest tests/test_template.txt docs/index.txt
}
