%global srcname copr-

Name: acolor
Version: 0.3.1
Release: 0%{?dist}
License: GPLv3
Summary: A trivial python 3 program for demonstrating RPM packaging
Url: https://github.com/xPMo/acolor
Source0: https://github.com/xPMo/%{name}/archive/%{version}.tar.gz

BuildArch: noarch
BuildRequires: make

Requires: bash
Requires: gawk
Requires: sed
Recommends: expect

%description
TODO

#-- PREP, BUILD & INSTALL -----------------------------------------------------#
%prep
%autosetup
# Automatic mangle doesn't cleanly remove env -S
find . -type f -exec sed -s -i '1 s/env -S //' '{}' '+'

%build

%install
PREFIX=%{buildroot}/%{_prefix} make install

#-- FILES ---------------------------------------------------------------------#
%files
%doc README.md
%license LICENSE
%{_bindir}/acol
%{_datadir}/acolor/

#-- CHANGELOG -----------------------------------------------------------------#
%changelog

