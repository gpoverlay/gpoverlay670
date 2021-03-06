# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN=github.com/git-lfs/git-lfs
inherit go-module

DESCRIPTION="Command line extension and specification for managing large files with git"
HOMEPAGE="https://git-lfs.github.com/"

if [[ "${PV}" = 9999* ]]; then
	EGIT_REPO_URI="https://${EGO_PN}"
	inherit git-r3
else
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~x86 ~amd64-linux ~x86-linux"
fi

LICENSE="Apache-2.0 BSD BSD-2 BSD-4 ISC MIT"
SLOT="0"
IUSE="doc test"

BDEPEND="doc? ( || ( app-text/ronn-ng app-text/ronn ) )"
RDEPEND="dev-vcs/git"

RESTRICT+=" !test? ( test )"

src_compile() {
	set -- go build \
		-ldflags="-X ${EGO_PN}/config.GitCommit=${GIT_COMMIT}" \
		-mod vendor -v -work -x \
		-o git-lfs git-lfs.go
	echo "$@"
	"$@" || die

	if use doc; then
		ronn docs/man/*.ronn || die "man building failed"
	fi
}

src_install() {
	dobin git-lfs
	dodoc {CHANGELOG,CODE-OF-CONDUCT,CONTRIBUTING,README}.md
	use doc && doman docs/man/*.1
}

src_test() {
	set -- go test \
		-ldflags="-X ${EGO_PN}/config.GitCommit=${GIT_COMMIT}" \
		-mod vendor \
		./...
	echo "$@"
	"$@" || die
}

pkg_postinst () {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog ""
		elog "Run \'git lfs install\' once for each user account manually."
		elog "For more details see https://bugs.gentoo.org/show_bug.cgi?id=733372."
	fi
}
