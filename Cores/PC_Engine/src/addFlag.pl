open(F,"cpu65xx_fast.vhd") or die;
while(<F>) {
	$line = $_;
	$line =~ s/("[01]+)"([ ,] -- [0-9A-F]{2})/$1\x30"$2/g;
	print $line;
}
close F;
