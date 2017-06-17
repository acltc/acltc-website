if (/Mac OS X|Linux|FreeBSD/.test(navigator.userAgent)) {
  document.documentElement.className += ' plat_osx';
} else {
  document.documentElement.className += ' plat_win';
}
