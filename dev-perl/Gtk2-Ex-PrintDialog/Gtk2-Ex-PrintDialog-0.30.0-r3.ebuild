# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=GBROWN
DIST_VERSION=0.03
inherit perl-module

DESCRIPTION="a simple, pure Perl dialog for printing PostScript data in GTK+ applications"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="cups"

RDEPEND="
	cups? ( dev-perl/Net-CUPS )
	dev-perl/Gtk2
	>=dev-perl/Locale-gettext-1.40.0
"
BDEPEND="${RDEPEND}
"
