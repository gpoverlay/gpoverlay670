# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
DIST_AUTHOR=HAARG
DIST_VERSION=2.000024
inherit perl-module

DESCRIPTION='create and use a local lib/ for perl modules with PERL5LIB'
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~riscv x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=virtual/perl-CPAN-1.820.0
	>=virtual/perl-ExtUtils-Install-1.430.0
	>=virtual/perl-ExtUtils-MakeMaker-7.0.0
	>=dev-perl/Module-Build-0.360.0
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.590.0
	test? ( virtual/perl-Test-Simple )
"
