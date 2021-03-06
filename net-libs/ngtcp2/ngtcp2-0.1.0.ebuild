# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/ngtcp2/ngtcp2.git"
	inherit git-r3
else
	SRC_URI="https://github.com/ngtcp2/ngtcp2/releases/download/v${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~hppa"
fi

DESCRIPTION="Implementation of the IETF QUIC Protocol"
HOMEPAGE="https://github.com/ngtcp2/ngtcp2/"

LICENSE="MIT"
SLOT="0/0"
IUSE="ssl test"

BDEPEND="virtual/pkgconfig"
DEPEND="ssl? ( >=dev-libs/openssl-1.1.1:0= )
	test? ( >=dev-util/cunit-2.1[${MULTILIB_USEDEP}] )"
RDEPEND=""
RESTRICT="!test? ( test )"

multilib_src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_OpenSSL=$(usex !ssl)
		-DCMAKE_DISABLE_FIND_PACKAGE_Libev=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Libnghttp3=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_CUnit=$(usex !test)
	)
	cmake_src_configure
}

multilib_src_test() {
	cmake_build check
}
