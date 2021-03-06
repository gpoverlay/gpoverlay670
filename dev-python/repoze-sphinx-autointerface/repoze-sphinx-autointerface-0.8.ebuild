# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

MY_PN=${PN//-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Sphinx extension: auto-generates API docs from Zope interfaces"
HOMEPAGE="https://pypi.org/project/repoze.sphinx.autointerface/"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	dev-python/namespace-repoze[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install

	# install the namespace (it's the only subpackage)
	python_moduleinto repoze.sphinx
	python_domodule repoze/sphinx/__init__.py
}

python_install_all() {
	distutils-r1_python_install_all

	find "${D}" -name '*.pth' -delete || die
}
