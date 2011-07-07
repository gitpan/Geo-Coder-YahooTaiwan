use Test::More tests => 3;
BEGIN { use_ok('Geo::Coder::YahooTaiwan') };
use strict;

my $geocoder = new Geo::Coder::YahooTaiwan;

my $ytw = $geocoder->geocode(location => '台北市南港區三重路66號');
is($ytw->{result}->{lat}, 25.05711, 'y!tw lat');
is($ytw->{result}->{lon}, 121.6143, 'y!tw lon');
