# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Docker complements LXC with a high-level API which operates at the process level. It runs unix processes with strong guarantees of isolation and repeatability across servers."
HOMEPAGE="http://www.docker.io/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/dotcloud/docker.git"
if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64"
fi

inherit git-2

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="
	app-arch/libarchive
	app-emulation/lxc
	net-firewall/iptables
	net-misc/curl
	sys-apps/iproute2
	|| (
		sys-fs/aufs3
		sys-kernel/aufs-sources
	)
"

src_compile() {
	emake VERBOSE=1
}

src_install() {
	dobin bin/docker
	dodoc AUTHORS CONTRIBUTING.md NOTICE README.md
}
