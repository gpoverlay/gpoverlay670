# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PN="fdm_materials"

DESCRIPTION="FDM materials for media-gfx/cura"
HOMEPAGE="https://github.com/Ultimaker/fdm_materials"
SRC_URI="https://github.com/Ultimaker/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="embedded"

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	local mycmakeargs=(
		-DEMBEDDED=$(usex embedded on off)
	)
	cmake_src_configure
}
