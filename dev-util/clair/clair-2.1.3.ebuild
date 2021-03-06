# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

DESCRIPTION="Vulnerability Static Analysis for Containers"
HOMEPAGE="https://github.com/quay/clair"

EGO_SUM=(
	"github.com/beorn7/perks v0.0.0-20160804104726-4c0e84591b9a"
	"github.com/beorn7/perks v0.0.0-20160804104726-4c0e84591b9a/go.mod"
	"github.com/coreos/pkg v0.0.0-20160727233714-3ac0863d7acf"
	"github.com/coreos/pkg v0.0.0-20160727233714-3ac0863d7acf/go.mod"
	"github.com/davecgh/go-spew v1.0.1-0.20160907170601-6d212800a42e"
	"github.com/davecgh/go-spew v1.0.1-0.20160907170601-6d212800a42e/go.mod"
	"github.com/fernet/fernet-go v0.0.0-20151007213151-1b2437bc582b"
	"github.com/fernet/fernet-go v0.0.0-20151007213151-1b2437bc582b/go.mod"
	"github.com/golang/protobuf v0.0.0-20170427213220-18c9bb326172"
	"github.com/golang/protobuf v0.0.0-20170427213220-18c9bb326172/go.mod"
	"github.com/guregu/null v3.0.2-0.20160228005316-41961cea0328+incompatible"
	"github.com/guregu/null v3.0.2-0.20160228005316-41961cea0328+incompatible/go.mod"
	"github.com/hashicorp/golang-lru v0.0.0-20160813221303-0a025b7e63ad"
	"github.com/hashicorp/golang-lru v0.0.0-20160813221303-0a025b7e63ad/go.mod"
	"github.com/julienschmidt/httprouter v1.1.0"
	"github.com/julienschmidt/httprouter v1.1.0/go.mod"
	"github.com/lib/pq v0.0.0-20170324204654-2704adc878c2"
	"github.com/lib/pq v0.0.0-20170324204654-2704adc878c2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/pborman/uuid v0.0.0-20160209185913-a97ce2ca70fa"
	"github.com/pborman/uuid v0.0.0-20160209185913-a97ce2ca70fa/go.mod"
	"github.com/pmezard/go-difflib v0.0.0-20151028094244-d8ed2627bdf0"
	"github.com/pmezard/go-difflib v0.0.0-20151028094244-d8ed2627bdf0/go.mod"
	"github.com/prometheus/client_golang v0.8.0"
	"github.com/prometheus/client_golang v0.8.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20170216185247-6f3806018612"
	"github.com/prometheus/client_model v0.0.0-20170216185247-6f3806018612/go.mod"
	"github.com/prometheus/common v0.0.0-20170427095455-13ba4ddd0caa"
	"github.com/prometheus/common v0.0.0-20170427095455-13ba4ddd0caa/go.mod"
	"github.com/prometheus/procfs v0.0.0-20170502131342-d098ca18df8b"
	"github.com/prometheus/procfs v0.0.0-20170502131342-d098ca18df8b/go.mod"
	"github.com/remind101/migrate v0.0.0-20160423010909-d22d647232c2"
	"github.com/remind101/migrate v0.0.0-20160423010909-d22d647232c2/go.mod"
	"github.com/sirupsen/logrus v0.11.5"
	"github.com/sirupsen/logrus v0.11.5/go.mod"
	"github.com/stretchr/testify v1.1.4"
	"github.com/stretchr/testify v1.1.4/go.mod"
	"github.com/tylerb/graceful v1.2.15"
	"github.com/tylerb/graceful v1.2.15/go.mod"
	"golang.org/x/sys v0.0.0-20170427041856-9ccfe848b9db/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170407172122-cd8b52f8269e"
	"gopkg.in/yaml.v2 v2.0.0-20170407172122-cd8b52f8269e/go.mod"
	)
go-module_set_globals
SRC_URI="https://github.com/coreos/clair/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

COMMON_DEPEND="acct-group/clair
	acct-user/clair"
	DEPEND="${COMMON_DEPEND}"
RDEPEND="app-arch/rpm
	app-arch/xz-utils
	dev-vcs/git
	${COMMON_DEPEND}
	!!sci-visualization/xd3d" # File collision (Bug #621044)

src_compile() {
	go build -o bin/${PN} ./cmd/${PN}  || die
}

src_install() {
	dobin bin/${PN}
	dodoc {README,ROADMAP,CONTRIBUTING}.md
	insinto /usr/share/${PN}
	doins -r contrib
	insinto /etc/${PN}
	doins config.example.yaml

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	keepdir /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
}
