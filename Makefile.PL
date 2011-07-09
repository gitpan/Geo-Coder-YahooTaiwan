use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Geo::Coder::YahooTaiwan',
    VERSION_FROM      => 'lib/Geo/Coder/YahooTaiwan.pm', # finds $VERSION
    PREREQ_PM         => {
      'JSON::XS' => 0,
      'LWP::UserAgent' => 0,
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Geo/Coder/YahooTaiwan.pm', # retrieve abstract from module
       AUTHOR         => 'Yen-Ming Lee <leeym@leeym.com>') : ()),
);
