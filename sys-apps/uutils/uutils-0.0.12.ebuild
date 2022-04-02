# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	Inflector-0.11.4
	ahash-0.4.7
	aho-corasick-0.7.18
	aliasable-0.1.3
	ansi_term-0.12.1
	arrayref-0.3.6
	arrayvec-0.5.2
	atty-0.2.14
	autocfg-1.0.1
	bigdecimal-0.3.0
	binary-heap-plus-0.4.1
	bindgen-0.59.2
	bit-set-0.5.2
	bit-vec-0.6.3
	bitflags-1.3.2
	blake2b_simd-0.5.11
	block-buffer-0.2.0
	bstr-0.2.17
	byte-tools-0.2.0
	byte-unit-4.0.13
	bytecount-0.6.2
	byteorder-1.4.3
	cc-1.0.72
	cexpr-0.6.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	clang-sys-1.3.0
	clap-2.34.0
	cloudabi-0.0.3
	compare-0.1.0
	constant_time_eq-0.1.5
	conv-0.3.3
	coz-0.1.3
	cpp-0.5.6
	cpp_build-0.4.0
	cpp_common-0.4.0
	cpp_common-0.5.6
	cpp_macros-0.5.6
	cpp_syn-0.12.0
	cpp_synmap-0.3.0
	cpp_synom-0.12.0
	crossbeam-channel-0.5.2
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.6
	crossbeam-utils-0.8.6
	crossterm-0.22.1
	crossterm_winapi-0.9.0
	ctor-0.1.21
	ctrlc-3.2.1
	custom_derive-0.1.7
	data-encoding-2.3.2
	data-encoding-macro-0.1.12
	data-encoding-macro-internal-0.1.10
	diff-0.1.12
	digest-0.6.1
	dlv-list-0.2.3
	dns-lookup-1.0.8
	dunce-1.0.2
	either-1.6.1
	env_logger-0.7.1
	env_logger-0.9.0
	exacl-0.6.0
	fake-simd-0.1.2
	fastrand-1.6.0
	file_diff-1.0.0
	filetime-0.2.15
	fnv-1.0.7
	fs_extra-1.2.0
	fts-sys-0.2.1
	fuchsia-cprng-0.1.1
	gcd-2.1.0
	generic-array-0.8.4
	getopts-0.2.21
	getrandom-0.1.16
	getrandom-0.2.4
	glob-0.3.0
	half-1.8.2
	hashbrown-0.9.1
	heck-0.3.3
	hermit-abi-0.1.19
	hex-0.2.0
	hostname-0.3.1
	humantime-2.1.0
	if_rust_version-1.0.0
	instant-0.1.12
	ioctl-sys-0.6.0
	itertools-0.8.2
	itertools-0.10.3
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.112
	libloading-0.7.3
	lock_api-0.4.5
	log-0.4.14
	lscolors-0.7.1
	match_cfg-0.1.0
	md5-0.3.8
	memchr-1.0.2
	memchr-2.4.1
	memmap2-0.5.2
	memoffset-0.6.5
	minimal-lexical-0.2.1
	mio-0.7.14
	miow-0.3.7
	nix-0.21.0
	nix-0.23.1
	nodrop-0.1.14
	nom-7.1.0
	ntapi-0.3.6
	num-bigint-0.4.3
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.1
	num_enum-0.5.6
	num_enum_derive-0.5.6
	number_prefix-0.4.0
	numtoa-0.1.0
	once_cell-1.9.0
	onig-4.3.3
	onig_sys-69.1.0
	ordered-multimap-0.3.1
	os_display-0.1.2
	ouroboros-0.10.1
	ouroboros_macro-0.10.1
	output_vt100-0.1.2
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	paste-0.1.18
	paste-1.0.6
	paste-impl-0.1.18
	peeking_take_while-0.1.2
	pkg-config-0.3.24
	platform-info-0.2.0
	ppv-lite86-0.2.16
	pretty_assertions-1.0.0
	proc-macro-crate-1.1.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.36
	quick-error-1.2.3
	quick-error-2.0.1
	quickcheck-0.9.2
	quote-0.3.15
	quote-1.0.14
	rand-0.5.6
	rand-0.7.3
	rand-0.8.4
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.2.0
	rand_hc-0.3.1
	rand_pcg-0.2.1
	rayon-1.5.1
	rayon-core-1.9.1
	redox_syscall-0.2.10
	redox_termios-0.1.2
	reference-counted-singleton-0.1.1
	regex-1.5.4
	regex-automata-0.1.10
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	retain_mut-0.1.2
	rlimit-0.4.0
	rust-ini-0.17.0
	rustc-hash-1.1.0
	same-file-1.0.6
	scopeguard-1.1.0
	selinux-0.2.5
	selinux-sys-0.5.1
	serde-1.0.133
	serde_derive-1.0.133
	sha1-0.6.0
	sha2-0.6.0
	sha3-0.6.0
	shlex-1.1.0
	signal-hook-0.3.13
	signal-hook-mio-0.2.1
	signal-hook-registry-1.4.0
	smallvec-1.8.0
	smawk-0.3.1
	socket2-0.4.2
	stable_deref_trait-1.2.0
	strsim-0.8.0
	strum-0.21.0
	strum_macros-0.21.1
	syn-1.0.85
	tempfile-3.3.0
	term_grid-0.1.7
	term_size-0.3.2
	termcolor-1.1.2
	terminal_size-0.1.17
	termion-1.5.6
	termsize-0.1.6
	textwrap-0.11.0
	textwrap-0.14.2
	thiserror-1.0.30
	thiserror-impl-1.0.30
	time-0.1.43
	toml-0.5.8
	typenum-1.15.0
	unicode-linebreak-0.1.2
	unicode-segmentation-1.8.0
	unicode-width-0.1.9
	unicode-xid-0.0.4
	unicode-xid-0.2.2
	unindent-0.1.7
	unix_socket-0.5.0
	users-0.10.0
	utf-8-0.7.6
	utf8-width-0.1.5
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.2+wasi-snapshot-preview1
	which-4.2.2
	wild-2.0.4
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xattr-0.2.2
	z85-3.0.4
"

inherit cargo

DESCRIPTION="GNU coreutils rewritten in Rust"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/uutils/coreutils"
SRC_URI="https://github.com/uutils/coreutils/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 CC0-1.0 ISC MIT Unlicense"
BDEPEND="dev-python/sphinx"

SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/coreutils-${PV}"

src_prepare() {
	default

	sed -i -e "s:gzip:tee:g" -e "s:1\.gz:1:g" GNUmakefile || die
}

src_compile() {
	emake V=1 PROFILE=release
}

src_install() {
	emake V=1 PREFIX="/usr" PROG_PREFIX="uu-" DESTDIR="${D}" MANDIR="/share/man/man1" install
}