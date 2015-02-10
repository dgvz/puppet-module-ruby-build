class ruby_build::packages::debian_vanilla {
	include git::packages

	if to_i($::operatingsystemrelease) < 6 {
		fail("ruby_build does not support Debian releases earlier than Squeeze (6.0)")
	}

	$packages = [
		"automake",
		"bison",
		"build-essential",
		"gawk",
		"libffi-dev",
		"libgdbm-dev",
		"libncurses5-dev",
		"libncursesw5-dev",
		"libreadline6-dev",
		"libsqlite3-dev",
		"libssl-dev",
		"libxml2-dev",
		"libxslt1-dev",
		"libyaml-dev",
		"patch",
		"subversion",
		"zlib1g-dev"
	]

	ensure_packages($packages)
	Package[$packages] -> Noop["ruby_build/packages/installed"]
}
